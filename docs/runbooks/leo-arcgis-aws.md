# Instrucciones para Leo — ArcGIS Enterprise en AWS (3 EC2 + WebGISDR)

Guía operativa para migrar **ArcGIS Enterprise 11.3** (`sig.conred.gob.gt`) desde 3 VPS Ubuntu 20.04 a **AWS EC2**, reinstalando componentes y migrando configuración y datos con **WebGISDR**.

Cuenta AWS: `631394011641` (CONRED).  
Usuario IAM de trabajo: `leonardo.villasenor`.

> **Importante:** licencias, instalables y backups **no** van al repo. Usar S3 privado + Secrets Manager. Acceso a máquinas vía **SSM Session Manager** (evitar SSH 22 abierto a `0.0.0.0/0`).

Relacionado: [AS-IS ArcGIS](../as-is/arcgis.md) · [Moodle/WP](leo-moodle-wordpress-rds.md) · [Tablero](leo-tablero-fargate-rds.md).

---

## 0. Target

| Rol | Origen (VPS) | Target AWS |
|-----|--------------|------------|
| Portal + Web Adaptor | `94.72.113.246` | EC2 `conred-arcgis-portal` |
| ArcGIS Server + GeoEvent | `94.72.113.72` | EC2 `conred-arcgis-server` |
| ArcGIS Data Store | `207.244.239.174` | EC2 `conred-arcgis-datastore` |

**URL producción:** `https://sig.conred.gob.gt`  
**URL PoC (recomendada durante pruebas):** `https://sig-poc.conred.gob.gt` o similar → luego cutover a `sig.conred.gob.gt`.

```
Internet
   │
   ▼
ALB (443, cert ACM para sig.conred.gob.gt)
   │
   ▼
EC2 Portal — Web Adaptor (Java) + Portal for ArcGIS
   │                    │
   │                    └── federado ──► EC2 Server (+ GeoEvent)
   │                                          │
   │                                          └── registrado ──► EC2 Data Store
   │
S3 — backups WebGISDR + instalables/licencias (bucket privado)
```

### Decisiones de esta guía

| Tema | Decisión |
|------|----------|
| Estrategia | **Reinstalar 11.3** en EC2 + **WebGISDR** backup/restore |
| Cómputo | **3 EC2** (un rol por máquina, igual que origen) |
| SO | **Ubuntu 22.04 LTS** (soportado por ArcGIS 11.3; origen era 20.04) |
| BD capas | **ArcGIS Data Store en EC2** — **no** usar RDS PostgreSQL |
| Entrada | **ALB** + **ACM** |
| Acceso admin | **SSM** + SG restrictivos |

---

## 0.1 Bloqueantes del cliente (no avanzar sin esto)

### Licencias (My Esri — versión **11.3**)

| Archivo | Componente |
|---------|------------|
| `portal.json` | Portal for ArcGIS |
| `*.prvc` o `*.ecp` | ArcGIS GIS Server |
| `*GeoEvent*.prvc` | GeoEvent Server (si aplica) |

Data Store **no** lleva licencia aparte en un deployment base.

Confirmar por escrito que el contrato permite **BYOL en AWS EC2**.

### Instalables Linux 11.3 (My Esri o copia de VPS)

| Paquete |
|---------|
| Portal_for_ArcGIS_Linux_113_* |
| ArcGIS_Web_Adaptor_Java_Linux_113_* |
| ArcGIS_Server_Linux_113_* |
| ArcGIS_GeoEvent_Server_113_* (si aplica) |
| ArcGIS_DataStore_Linux_113_* |

Subir a bucket S3 privado, p. ej. `s3://conred-arcgis-artifacts/installers/`.

### Inventario y acceso

| # | Qué |
|---|-----|
| 1 | Tamaño de disco **VPS1** (Portal) y **VPS2** (Server) — VPS3 ya medido (~53 GB usados) |
| 2 | SSH/SSM o acceso para ejecutar **WebGISDR** en origen |
| 3 | Usuario admin Portal (para backup/restore) |
| 4 | Export config **GeoEvent** si sigue en alcance |
| 5 | Quién publica DNS de `sig.conred.gob.gt` |
| 6 | Ventana de mantenimiento para backup final + cutover |

---

## 1. Acceso AWS

```bash
aws configure --profile conred
aws sts get-caller-identity --profile conred
```

Permisos: VPC/EC2, ELB, ACM, Route 53 (si aplica), S3, IAM, Secrets Manager, CloudWatch, SSM.

---

## 2. Red (VPC)

Reutilizar VPC del tablero/campus si hay subnets privadas + NAT; si no, crear PoC.

| Recurso | Uso |
|---------|-----|
| Subnets **privadas** (2 AZ) | 3 EC2 ArcGIS |
| Subnets **públicas** | ALB |
| NAT Gateway | Salida desde EC2 (parches, My Esri, etc.) |
| `sg-alb` | Inbound **443** (y 80→redirect) desde internet |
| `sg-portal` | Inbound **80/443** solo desde `sg-alb`; tráfico ArcGIS desde `sg-server`, `sg-datastore` |
| `sg-server` | Tráfico ArcGIS desde `sg-portal`, `sg-datastore` |
| `sg-datastore` | Tráfico ArcGIS solo desde `sg-server` (y Portal si aplica) |

### Puertos internos (abrir entre los 3 SG)

| Componente | Puertos típicos |
|------------|-----------------|
| Portal | 7443, 7005, 7099, 7080 |
| Server | 6080, 6443, 6143 |
| Data Store | 24443, 29080, 9876 |
| GeoEvent | 6180, 6143 (validar en origen) |

Regla práctica: crear `sg-arcgis-internal` y permitir **todo el tráfico TCP** entre `sg-portal`, `sg-server` y `sg-datastore` dentro de la VPC.

RDS **no** se usa para Data Store.

---

## 3. S3 — artefactos y backups

```bash
aws s3 mb s3://conred-arcgis-artifacts --profile conred
# Block public access ON (default)
```

Estructura sugerida:

```text
s3://conred-arcgis-artifacts/
├── installers/          # .tar.gz de My Esri
├── licenses/            # portal.json, *.prvc (cifrado / IAM restrictivo)
├── webgisdr-export/     # backups desde origen
└── webgisdr-restore/    # copias de trabajo en AWS
```

Secrets Manager (opcional): rutas o referencias a licencias; **no** el contenido en task definitions públicas.

---

## 4. EC2 — crear las 3 máquinas

### 4.1 Sizing inicial (ajustar tras inventario VPS1/VPS2)

| Instancia | Tipo sugerido PoC | Disco root (EBS gp3) | Notas |
|-----------|-------------------|----------------------|--------|
| `conred-arcgis-portal` | `m5.xlarge` (4 vCPU / 16 GB) | 100 GB | Portal + Web Adaptor |
| `conred-arcgis-server` | `m5.xlarge` o `m5.2xlarge` | 150 GB | Server + GeoEvent |
| `conred-arcgis-datastore` | `m5.large` | **120 GB** mínimo (origen ~53 GB usados + crecimiento) | Solo Data Store |

| Campo común | Valor |
|-------------|--------|
| AMI | Ubuntu **22.04** LTS amd64 |
| Subnet | privada |
| Public IP | OFF |
| IAM instance profile | `AmazonSSMManagedInstanceCore` |
| Key pair | solo si SSM no basta; preferir SSM |

Hostname sugeridos (DNS interno o `/etc/hosts`):

```text
arcgis-portal.internal
arcgis-server.internal
arcgis-datastore.internal
```

### 4.2 Preparación SO (en cada EC2, como root)

```bash
apt update && apt upgrade -y
apt install -y wget curl unzip libxml2 libxslt1.1 libaio1 fontconfig \
  libfreetype6 libxcb1 libxrender1 libxi6 libgl1

# Usuario arcgis (requerido por Esri)
useradd -m -s /bin/bash arcgis
# Seguir checklist de Esri: límites de archivos abiertos, kernel params, etc.
# Ver: ArcGIS Enterprise system requirements 11.3 Linux
```

Descargar instaladores desde S3 a `/opt/arcgis-install/`:

```bash
aws s3 sync s3://conred-arcgis-artifacts/installers/ /opt/arcgis-install/
```

---

## 5. Instalar ArcGIS 11.3 (orden obligatorio)

Instalar **en este orden** y **misma versión 11.3** en los tres nodos.

### 5.1 Data Store (EC2 `conred-arcgis-datastore`) — primero

```bash
cd /opt/arcgis-install
tar -xvf ArcGIS_DataStore_Linux_113_*.tar.gz
cd arcgis/datastore
./install_datastore.sh
# Modo silencioso si aplica: ver documentación Esri
```

1. Crear site Data Store (primera máquina del rol).
2. Anotar URL interna del Data Store (p. ej. `https://arcgis-datastore.internal:2443/`).
3. **No** registrar aún con Server hasta que Server esté instalado.

### 5.2 ArcGIS Server + GeoEvent (EC2 `conred-arcgis-server`)

```bash
cd /opt/arcgis-install
tar -xvf ArcGIS_Server_Linux_113_*.tar.gz
cd arcgis/server
./install_server.sh
```

**Autorizar Server:**

```bash
su - arcgis
cd /arcgis/server/tools
./authorizeSoftware /opt/arcgis-install/licenses/server.prvc
# o .ecp — email org si lo pide
```

**Crear site Server:**

- URL admin: `https://arcgis-server.internal:6443/arcgis`
- Usuario admin inicial (guardar en Secrets Manager).

**GeoEvent** (si aplica):

```bash
# Instalar paquete GeoEvent sobre la misma máquina
tar -xvf ArcGIS_GeoEvent_Server_113_*.tar.gz
# Seguir wizard GeoEvent; autorizar con licencia GeoEvent
```

Exportar config GeoEvent en **origen** antes del cutover; importar en AWS tras restore si Esri lo indica en su doc de migración.

### 5.3 Portal (EC2 `conred-arcgis-portal`)

```bash
tar -xvf Portal_for_ArcGIS_Linux_113_*.tar.gz
cd arcgis/portal
./install_portal.sh
```

**Crear Portal:**

- URL PoC: `https://sig-poc.conred.gob.gt/portal` (o la que acuerden con CONRED).
- Importar `portal.json` en el asistente de creación.
- Usuario inicial Portal (Secrets Manager).

### 5.4 Web Adaptor (misma EC2 Portal)

```bash
tar -xvf ArcGIS_Web_Adaptor_Java_Linux_113_*.tar.gz
cd arcgis/webadaptor/11.3/java
./setup.sh
```

Configurar Web Adaptor para:

- Portal → `https://sig-poc.conred.gob.gt/portal`
- Server → `https://sig-poc.conred.gob.gt/server`

El Web Adaptor escucha en **80/443** (detrás del ALB).

### 5.5 Federar y registrar Data Store

Desde **Portal** (como administrador):

1. **Federar** ArcGIS Server con Portal (`https://arcgis-server.internal:6443/arcgis`, credenciales admin Server).
2. **Designar hosting server** (el site federado).
3. En Server Manager → **Registrar** ArcGIS Data Store con la URL del Data Store.

Validar en Portal → Organización → Estado: Server federado, Data Store registrado, sin errores rojos.

---

## 6. ALB + ACM

### 6.1 Certificado ACM

- Dominio: `sig.conred.gob.gt` (y `sig-poc.conred.gob.gt` si se usa en PoC).
- Validación DNS con CONRED.

### 6.2 Target group

| Campo | Valor |
|-------|--------|
| Tipo | instance |
| Puerto | **443** o **80** (según cómo quede Web Adaptor; típico **443** con cert en WA o terminar TLS en ALB) |
| Health check | `GET /portal/home/` o `/portal/sharing/rest/portals/self` (200) |

**Recomendación PoC:** TLS en **ALB** (ACM) → HTTP **80** al Web Adaptor en EC2 Portal.

### 6.3 Listener

- 443 → target group Portal
- 80 → redirect a HTTPS

Registros DNS (cuando PoC OK):

```text
sig.conred.gob.gt  →  ALB DNS name (alias A/AAAA)
```

---

## 7. Migrar datos y configuración — WebGISDR

Herramienta oficial Esri. Migra Portal, Server, Data Store federado, usuarios, mapas y configuración (no es copiar `/opt/arcgis` a mano).

### 7.1 En ORIGEN (VPS Portal — ventana de mantenimiento)

1. Avisar a usuarios / modo mantenimiento.
2. En la máquina Portal (como `arcgis`):

```bash
cd /arcgis/portal/tools/webgisdr
# Crear webgisdr.properties según doc Esri 11.3 (URLs, rutas, credenciales admin)
./webgisdr --export-site --output-folder /backup/webgisdr-$(date +%Y%m%d)
```

3. Copiar el backup a S3:

```bash
aws s3 sync /backup/webgisdr-YYYYMMDD/ s3://conred-arcgis-artifacts/webgisdr-export/YYYYMMDD/
```

4. Verificar tamaño y que el export terminó sin errores.

Documentación Esri: [Migration scenarios with WebGISDR](https://enterprise.arcgis.com/en/portal/11.3/administer/linux/migration-scenarios-with-webgisdr.htm).

### 7.2 En AWS (EC2 Portal — después de federar el stack vacío)

1. Descargar backup:

```bash
aws s3 sync s3://conred-arcgis-artifacts/webgisdr-export/YYYYMMDD/ /restore/incoming/
```

2. Ajustar `webgisdr.properties` del **target** con URLs AWS (`sig-poc` o `sig.conred.gob.gt`).

3. Restore:

```bash
cd /arcgis/portal/tools/webgisdr
./webgisdr --import-site --data /restore/incoming/<carpeta-del-backup>
```

4. El restore **sobrescribe** el contenido del deployment target con el del backup, incluyendo URLs si está configurado así.

5. Reiniciar servicios si lo indica el log (`startportal.sh`, `startserver.sh`, servicios Data Store).

### 7.3 Sync final en cutover

1. Mantenimiento en origen.
2. Export WebGISDR **incremental/final** (último backup).
3. Restore en AWS.
4. Cambiar DNS a ALB.
5. Apagar o aislar VPS origen.

---

## 8. Prueba de humo

### 8.1 Infraestructura

- [ ] 3 EC2 en estado running, SSM conecta
- [ ] ALB target **healthy**
- [ ] Comunicación Portal ↔ Server ↔ Data Store (sin error en logs)

### 8.2 Portal

- [ ] `https://sig-poc.conred.gob.gt/portal` (o Host header contra ALB) carga login
- [ ] Login admin
- [ ] Organización → **Estado** sin fallos críticos

### 8.3 Server y mapas

- [ ] `https://.../server/rest/services` lista servicios
- [ ] Abrir un **mapa web** existente
- [ ] Capa alojada muestra geometrías (Data Store OK)
- [ ] Buscar un ítem por nombre conocido (contenido migrado)

### 8.4 GeoEvent (si aplica)

- [ ] Servicio GeoEvent running
- [ ] Reglas / inputs críticos presentes tras import config

### 8.5 Rendimiento y logs

- [ ] CloudWatch agent o logs en `/arcgis/portal/arcgisportal/logs`, `/arcgis/server/usr/logs`
- [ ] Disco Data Store < 80% uso

### 8.6 Probar antes de DNS público

```bash
curl -Ik -H "Host: sig.conred.gob.gt" https://<dns-del-alb>/portal/
```

---

## 9. Cutover DNS

1. TTL bajo 24–48 h antes.
2. Backup WebGISDR final + restore en AWS.
3. Validar humo con URL real en `/etc/hosts` apuntando al ALB.
4. CONRED cambia `sig.conred.gob.gt` → ALB.
5. Monitorear 24–48 h.
6. **Rollback:** revertir DNS a VPS origen (mantener VPS encendidos hasta estabilizar).

---

## 10. Post-migración

| Tarea | Frecuencia |
|-------|------------|
| WebGISDR export → S3 | Semanal (o según RPO CONRED) |
| Snapshots EBS Data Store | Diario |
| Parches Esri | Según [My Esri] / ciclo CONRED |
| Revisión disco Portal/Server | Mensual |

---

## 11. Orden de trabajo resumido

| # | Acción | Responsable |
|---|--------|-------------|
| 1 | Cliente entrega licencias + instalables + acceso VPS | CONRED |
| 2 | VPC, SG, S3, 3 EC2 | Leo |
| 3 | Preparar SO + bajar instaladores de S3 | Leo |
| 4 | Instalar Data Store → Server (+GeoEvent) → Portal → Web Adaptor | Leo |
| 5 | Autorizar licencias en cada componente | Leo (archivos de CONRED) |
| 6 | Federar Server + registrar Data Store | Leo |
| 7 | ALB + ACM | Leo |
| 8 | WebGISDR export origen → S3 | Leo (+ admin Portal CONRED) |
| 9 | WebGISDR import en AWS | Leo |
| 10 | Prueba de humo | Leo + CONRED |
| 11 | Cutover DNS | CONRED DNS + Leo valida |
| 12 | Descomisionar VPS (tras periodo estabilización) | CONRED |

---

## 12. Naming sugerido

| Recurso | Nombre ejemplo |
|---------|----------------|
| Bucket S3 | `conred-arcgis-artifacts` |
| EC2 Portal | `conred-arcgis-portal` |
| EC2 Server | `conred-arcgis-server` |
| EC2 Data Store | `conred-arcgis-datastore` |
| ALB | `conred-arcgis-alb` |
| TG | `tg-arcgis-portal` |
| Secret licencias | `conred/arcgis/licenses` |

---

## 13. Errores frecuentes

| Síntoma | Causa típica |
|---------|----------------|
| Federación falla | Puertos SG bloqueados entre EC2; hostname no resuelve |
| Restore WebGISDR falla | Versiones distintas (≠ 11.3); backup incompleto; URLs mal en properties |
| Mapas sin geometría | Data Store no registrado o restore incompleto |
| 502 en ALB | Web Adaptor no escucha en puerto del TG; health check mal |
| Licencia rechazada | Archivo de otra versión o rol incorrecto (GIS vs GeoEvent) |

---

## 14. Referencias Esri

- [System requirements 11.3 Linux](https://enterprise.arcgis.com/en/portal/11.3/install/linux/arcgis-portal-system-requirements.htm)
- [WebGISDR migration scenarios](https://enterprise.arcgis.com/en/portal/11.3/administer/linux/migration-scenarios-with-webgisdr.htm)
- [ArcGIS Enterprise on AWS](https://enterprise.arcgis.com/en/server/11.3/cloud/amazon/arcgis-server-architectures-on-aws.htm)

---

## 15. Fuera de alcance

- Campus Virtual (Moodle/WP) y Tablero Django (runbooks aparte).
- Upgrade 11.3 → versión mayor.
- Alta disponibilidad multi-máquina (PoC es 1 nodo por rol).
- ArcGIS Online.

Si algo bloquea, documentar error exacto + fecha en este repo o issue interno.
