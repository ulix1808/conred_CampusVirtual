# Estado actual (AS-IS) — ArcGIS CONRED

Fuente: discovery CONRED (`Docu ArcGis CONRED.txt`, 2026). **Sin secretos.**

URL pública: `https://sig.conred.gob.gt`

---

## Resumen

Solución **ArcGIS Enterprise 11.3** distribuida en **3 VPS** Ubuntu 20.04. Arquitectura federada: Portal + Server + Data Store. Sin integraciones externas reportadas (solo federación interna).

```
                Usuarios
                    │
              HTTPS (443)
                    │
           Web Adaptor (Java/Linux)
             ┌──────────────┐
             │              │
             ▼              ▼
     Portal for ArcGIS   ArcGIS Server
     (VPS 1)             + GeoEvent Server
                          (VPS 2)
                               │
                               ▼
                      ArcGIS Data Store
                      (VPS 3 — relacional)
```

---

## 1. Sistema operativo

Los **3 servidores** usan:

| Campo | Valor |
|-------|--------|
| Distribución | Ubuntu 20.04.6 LTS (Focal Fossa) |
| ID | `ubuntu` / `debian` family |
| Codename | `focal` |

---

## 2. Componentes ArcGIS instalados

| VPS | IP | Componentes (versión 11.3) |
|-----|-----|----------------------------|
| **VPS 1** | `94.72.113.246` | ArcGIS Web Adaptor (Java, Linux) · Portal for ArcGIS |
| **VPS 2** | `94.72.113.72` | ArcGIS Server · ArcGIS GeoEvent Server (IoT / big data) |
| **VPS 3** | `207.244.239.174` | ArcGIS Data Store |

Paquetes referenciados en origen:

- `ArcGIS_Web_Adaptor_Java_Linux_113_190319`
- `Portal_for_ArcGIS_Linux_113_190316`
- `ArcGIS_Server_Linux_113_190305`
- `ArcGIS_GeoEvent_Server_113_190331`
- `ArcGIS_DataStore_Linux_113_190318`

---

## 3. Base de datos

| Ítem | Valor |
|------|--------|
| Producto | ArcGIS Data Store **11.3.0.51575** — Relational Data Store |
| Motor interno | PostgreSQL **15.5** (administrado por Esri, no BD externa) |
| Base principal | `db_oaa14` |
| Estado | Iniciado · disponible · **READWRITE** |
| ArcGIS Server | `https://sig.conred.gob.gt/server` |
| Portal | `https://sig.conred.gob.gt/portal` |

---

## 4. Almacenamiento geoespacial

### VPS 3 (Data Store) — medido

Ruta: `/opt/arcgis/datastore/usr/arcgisdatastore/pgdata`

| Contenido | Tamaño aprox. |
|-----------|----------------|
| Base administrada (`db_oaa14`) — geometrías, atributos, índices | **13.0 GiB** |
| PostgreSQL completo (incl. WAL ~2.1 GiB) | **15.1 GiB** |

**Nota:** no hay **Tile Cache Data Store** activo en VPS 3; no se observa almacenamiento significativo de teselas/cachés ahí.

### Dónde vive el resto (no medido en este pass)

| Tipo de dato | Ubicación probable |
|--------------|-------------------|
| Mapas web, elementos, config Portal | Almacenamiento de **Portal** → VPS 1 |
| Servicios, rásteres, geodatabases, carpetas fuente | **ArcGIS Server** (VPS 2) y/o BD/carpetas externas |

---

## 5. Roles por servidor

| # | IP | Función |
|---|-----|---------|
| 1 | `94.72.113.246` | Entrada (Web Adaptor) + **Portal for ArcGIS** |
| 2 | `94.72.113.72` | **ArcGIS Server** + **GeoEvent Server** |
| 3 | `207.244.239.174` | **ArcGIS Data Store** (relacional) |

---

## 6. Integraciones

| Integración | ¿Aplica? |
|-------------|----------|
| Federación ArcGIS Server ↔ Portal | **Sí** |
| Otros sistemas (LDAP, APIs externas, etc.) | **No** reportado |

---

## 7. Tamaños (VPS 3 — Data Store)

| Concepto | Aproximado |
|----------|------------|
| Datos principales (`db_oaa14`) | 13.0 GiB |
| PostgreSQL activo (incl. WAL) | 15.1 GiB |
| Copias de seguridad | 27.1 GiB |
| Datos activos + respaldos | 42.2 GiB |
| Instalación completa ArcGIS Data Store | 45.3 GiB |
| Uso total VPS (SO + otros) | 53.4 GiB |
| Capacidad disco | 1.6 TB |
| Espacio libre | ~1.5 TB |

> Los tamaños de VPS 1 (Portal) y VPS 2 (Server / GeoEvent) **no** están en este discovery; pedir inventario de disco en esos nodos antes de migración.

---

## Preguntas abiertas para migración AWS

- [ ] Tamaño de almacenamiento Portal (VPS 1) y Server (VPS 2)
- [ ] Licenciamiento Esri en target (BYOL / cloud)
- [ ] ¿GeoEvent sigue en alcance o solo Portal + Server + Data Store?
- [ ] Certificados TLS y DNS de `sig.conred.gob.gt`
- [ ] Estrategia: lift 3 VMs vs. reinstalar ArcGIS Enterprise en EC2
- [ ] Backup/restore validado de los 3 roles
