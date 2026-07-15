# Instrucciones para Leo — Moodle + WordPress en AWS (dominios separados + 1 RDS)

Guía operativa para migrar el **Campus Virtual** hoy en Plesk (`vmi1102881`) a AWS, **separando** WordPress y Moodle en dominios distintos y usando **un solo RDS** MySQL/MariaDB con **dos bases de datos**.

Cuenta AWS: `631394011641` (CONRED).  
Usuario IAM de trabajo: `leonardo.villasenor`.

> **Importante:** Access Key ID + Secret Access Key. No subir `wp-config.php`, `config.php`, dumps ni secrets al repo.

Relacionado: [Tablero Inform → Fargate + RDS](leo-tablero-fargate-rds.md) (otro stack: Django + PostgreSQL).

---

## 0. Target acordado

| URL | App | Origen hoy |
|-----|-----|------------|
| `https://campusvirtual.conred.gob.gt/` | **WordPress** 7.0.1 | raíz de `httpdocs/` |
| `https://aulavirtual.campusvirtual.conred.gob.gt/` | **Moodle** 5.0.2 | `httpdocs/aulavirtualconred/` |

```
Internet
   │
   ▼
ALB (HTTPS, host rules)
   ├── Host: campusvirtual.conred.gob.gt          → WP  (EC2 / target group)
   └── Host: aulavirtual.campusvirtual.conred.gob.gt → Moodle (EC2 / target group)
            │
            ▼
   RDS MySQL o MariaDB (privado) — UNA instancia
      ├── database `wordpress`  + user `wp_app`
      └── database `moodle`     + user `mdl_app`

EFS (recomendado) o EBS
   ├── /wp-content/uploads   (~50 GB)
   └── /moodledata           (~349 MB)
```

### Decisiones de esta guía

| Tema | Decisión PoC |
|------|-------------|
| Estrategia | **Reinstalar limpio** + restore (no MGN) |
| Cómputo | **EC2** (Amazon Linux 2023 o Ubuntu 22.04) + nginx + PHP 8.3-FPM |
| ¿1 o 2 EC2? | **2 EC2** (una por app) — aislamiento claro; si el presupuesto aprieta, 1 EC2 con 2 vhosts |
| BD | **1 RDS** · 2 databases · 2 usuarios |
| Motor RDS | **MySQL 8.0** *o* **MariaDB 10.11** — elegir según versión del origen (`mysql -V`) |
| Ficheros | **EFS** montado en ambas EC2 (uploads + moodledata); alternativa: EBS grande solo en WP |
| Contenedores / Fargate | Fuera del PoC inicial (evaluar después) |
| Tablero Django | **No** forma parte de este runbook |

### AS-IS (recordatorio)

Rutas en origen:

```text
/var/www/vhosts/campusvirtual.conred.gob.gt/
├── moodledata/
├── moodle-database.sql.zip          # posible dump (validar frescura)
├── wordpress-backups/
└── httpdocs/
    ├── wp-*.php, wp-content/, wp-config.php   ← WordPress
    └── aulavirtualconred/                     ← Moodle (+ config.php)
```

Cron Moodle hoy:

```text
* * * * * /opt/plesk/php/8.3/bin/php \
  .../httpdocs/aulavirtualconred/admin/cli/cron.php >/dev/null 2>&1
```

Moodle y WP **no** comparten BD ni auth; solo la máquina.

---

## 0.1 Bloqueantes del cliente (antes de AWS)

Sin esto no avances a restore/cutover. Pedir por canal seguro (S3 / SharePoint / rsync), **no** por chat.

### WordPress

| # | Artefacto |
|---|-----------|
| 1 | `wp-config.php` |
| 2 | Dump BD (`.sql.gz`) fresco |
| 3 | `wp-content/` completo (plugins, themes, **uploads ~50 GB**) |
| 4 | Lista plugins/temas custom |

### Moodle

| # | Artefacto |
|---|-----------|
| 1 | `config.php` |
| 2 | Dump BD fresco (validar si `moodle-database.sql.zip` del server sirve) |
| 3 | Carpeta `moodledata/` (~349 MB) |
| 4 | Código `aulavirtualconred/` **o** Moodle 5.0.2 + plugins |
| 5 | Salida de `mysql -V` / `mariadb --version` |

### DNS / TLS

| # | Confirmación |
|---|--------------|
| 1 | Subdominio Moodle: `aulavirtual.campusvirtual.conred.gob.gt` |
| 2 | Quién publica DNS (CONRED) y quién pide cert ACM |
| 3 | ¿Redirect 301 de `…/aulavirtualconred` → nuevo host Moodle? |

Plantillas repo: `config.example.php`, `docs/inventario/moodle-config.example.php`.

---

## 1. Acceso AWS (1 vez)

Igual que el tablero:

```bash
aws configure --profile conred
# región: confirmar con arquitectura (ej. us-east-1)
aws sts get-caller-identity --profile conred
```

Permisos: VPC/EC2, RDS, EFS, ELB, ACM, Route 53 (o solo DNS externo), IAM, Secrets Manager, CloudWatch, Systems Manager (Session Manager recomendado).

---

## 2. Red (VPC)

Reutilizar la VPC del tablero **si** ya existe y hay subnets privadas + NAT; si no, crear PoC.

| Recurso | Uso |
|---------|-----|
| 2+ subnets **privadas** (AZs distintas) | EC2 apps + RDS + mount targets EFS |
| 2+ subnets **públicas** | ALB (+ NAT si EC2 en privada) |
| NAT Gateway | Salida desde privadas (yum/apt, Composer, certbot opcional) |
| `sg-alb` | Inbound **443** (y 80→redirect) desde internet |
| `sg-wp` | Inbound **80** solo desde `sg-alb` |
| `sg-moodle` | Inbound **80** solo desde `sg-alb` |
| `sg-rds` | Inbound **3306** solo desde `sg-wp` **y** `sg-moodle` |
| `sg-efs` | Inbound **2049** solo desde `sg-wp` y `sg-moodle` |

Regla de oro: RDS **no** público. Sin SSH 22 abierto a `0.0.0.0/0` — usar **SSM Session Manager**.

---

## 3. RDS — una instancia, dos bases

### 3.1 Crear instancia

| Campo | Valor sugerido PoC |
|-------|---------------------|
| Engine | MySQL 8.0 **o** MariaDB 10.11 (según origen) |
| Template | Dev/Test (PoC) → Multi-AZ después |
| DB instance class | `db.t4g.medium` (ajustar tras carga) |
| Storage | gp3 · empezar **100 GB** (cabe WP dumps + headroom; uploads van en EFS) |
| Subnet group | subnets **privadas** |
| Public access | **No** |
| VPC security group | `sg-rds` |
| Master username | `admin` (solo admin; **no** lo usen las apps) |

Anotar: **endpoint** `xxxx.region.rds.amazonaws.com`.

### 3.2 Crear databases y usuarios de app

Conectar (bastion / SSM port-forward / EC2 temporal en la VPC):

```sql
-- WordPress
CREATE DATABASE wordpress CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'wp_app'@'%' IDENTIFIED BY 'CHANGE_ME_STRONG';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wp_app'@'%';

-- Moodle
CREATE DATABASE moodle CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'mdl_app'@'%' IDENTIFIED BY 'CHANGE_ME_STRONG';
GRANT ALL PRIVILEGES ON moodle.* TO 'mdl_app'@'%';

FLUSH PRIVILEGES;
```

Guardar passwords en **Secrets Manager**:

- `conred/campusvirtual/wordpress/db`
- `conred/campusvirtual/moodle/db`

### 3.3 Restore de dumps

```bash
# Desde una EC2 con acceso a sg-rds
gunzip -c wordpress-YYYYMMDD.sql.gz | mysql -h <RDS_ENDPOINT> -u wp_app -p wordpress
gunzip -c moodle-YYYYMMDD.sql.gz    | mysql -h <RDS_ENDPOINT> -u mdl_app -p moodle
```

Validar:

```sql
SHOW TABLES FROM wordpress;
SHOW TABLES FROM moodle;   -- prefijo típico mdl_
```

Si el dump de Moodle viene de MariaDB y el RDS es MySQL (o al revés), documentar errores de restore y ajustar motor/versión.

---

## 4. Almacenamiento de ficheros (EFS)

1. Crear **EFS** en la VPC (Encryption at rest ON).
2. Mount targets en las mismas AZs que las EC2.
3. Security group `sg-efs`.
4. En cada EC2:

```bash
# Ejemplo Amazon Linux
sudo mkdir -p /mnt/efs
sudo mount -t efs -o tls fs-xxxxxxxx:/ /mnt/efs
sudo mkdir -p /mnt/efs/wordpress/uploads /mnt/efs/moodledata
```

Sync desde origen (rsync preferible para los ~50 GB de uploads):

```bash
# En origen o desde máquina de salto con ambos accesos
rsync -avh --progress /ruta/wp-content/uploads/  /mnt/efs/wordpress/uploads/
rsync -avh --progress /ruta/moodledata/          /mnt/efs/moodledata/
```

Medir tiempo de copia de uploads (~50 GB) — impacta ventana de cutover.

---

## 5. EC2 — WordPress

### 5.1 Instancia

| Campo | PoC |
|-------|-----|
| AMI | Amazon Linux 2023 / Ubuntu 22.04 |
| Tipo | `t3.medium` (subir si hace falta) |
| Subnet | privada |
| SG | `sg-wp` (+ SSM) |
| IAM instance profile | `AmazonSSMManagedInstanceCore` |
| Disco root | 30 GB gp3 (código); uploads en EFS |

### 5.2 Stack web

- nginx  
- PHP 8.3-FPM  
- extensiones: `mysqli`, `pdo_mysql`, `gd`, `xml`, `mbstring`, `curl`, `zip`, `intl`  

Document root sugerido: `/var/www/campusvirtual` (core WP + `wp-content` con `uploads` → symlink o bind a EFS).

### 5.3 Config

Editar `wp-config.php` (valores reales solo en servidor / Secrets):

```php
define('DB_NAME', 'wordpress');
define('DB_USER', 'wp_app');
define('DB_PASSWORD', '...');           // o inyección desde SM
define('DB_HOST', '<RDS_ENDPOINT>');
define('DB_CHARSET', 'utf8mb4');

// Si cambian URLs más adelante, usar WP-CLI search-replace
```

Tras restore, si hace falta forzar URL:

```bash
wp option update siteurl 'https://campusvirtual.conred.gob.gt'
wp option update home    'https://campusvirtual.conred.gob.gt'
```

Permisos: usuario de PHP-FPM debe escribir en `uploads` (EFS).

### 5.4 Health

nginx debe responder **200** en `/` (o ruta acordada) para el health check del ALB.

---

## 6. EC2 — Moodle

### 6.1 Instancia

Misma línea que WP: `sg-moodle`, PHP 8.3, nginx, SSM.  
Document root: `/var/www/aulavirtual` (contenido de `aulavirtualconred/`).  
`dataroot`: `/mnt/efs/moodledata` (fuera del webroot).

### 6.2 `config.php` (target)

```php
$CFG->dbtype    = 'mysqli';   // o 'mariadb' según RDS
$CFG->dbhost    = '<RDS_ENDPOINT>';
$CFG->dbname    = 'moodle';
$CFG->dbuser    = 'mdl_app';
$CFG->dbpass    = '...';
$CFG->prefix    = 'mdl_';

// URL NUEVA (ya no es /aulavirtualconred en campusvirtual)
$CFG->wwwroot   = 'https://aulavirtual.campusvirtual.conred.gob.gt';
$CFG->dataroot  = '/mnt/efs/moodledata';
```

### 6.3 Cambio de URL (importante)

Moodle guardó la URL vieja. Tras restore:

1. Poner el `wwwroot` nuevo en `config.php`.  
2. Ejecutar herramienta oficial de reemplazo de URL (UI admin o CLI `admin/cli`) para sustituir:

   - de: `https://campusvirtual.conred.gob.gt/aulavirtualconred`  
   - a: `https://aulavirtual.campusvirtual.conred.gob.gt`

3. Purge caches Moodle.

### 6.4 Cron

En la EC2 Moodle (crontab del usuario web o root con `-u`):

```cron
* * * * * /usr/bin/php /var/www/aulavirtual/admin/cli/cron.php >/dev/null 2>&1
```

Confirmar path real de `php` 8.3 (`which php`).

---

## 7. ALB + TLS + host rules

### 7.1 Certificado ACM

Pedir en ACM (misma región que el ALB), validación DNS:

- `campusvirtual.conred.gob.gt`
- `aulavirtual.campusvirtual.conred.gob.gt`

(o wildcard `*.campusvirtual.conred.gob.gt` **si** cubre el subdominio acordado — validar con quien gestione DNS).

### 7.2 Target groups

| TG | Tipo | Puerto | Health check |
|----|------|--------|--------------|
| `tg-wordpress` | instance | 80 | `GET /` |
| `tg-moodle` | instance | 80 | `GET /` (o `/login/index.php` si `/` redirige raro) |

Registrar cada EC2 en su TG.

### 7.3 Listener rules (443)

| Prioridad | Condición Host | Acción |
|-----------|----------------|--------|
| 10 | `aulavirtual.campusvirtual.conred.gob.gt` | forward → `tg-moodle` |
| 20 | `campusvirtual.conred.gob.gt` | forward → `tg-wordpress` |
| default | — | fixed 404 o redirect a campusvirtual |

Listener 80: redirect a HTTPS.

### 7.4 Probar **antes** del DNS público

Si el ALB tiene host rules, el DNS crudo del ALB **no** alcanza: el `Host` debe ser el dominio real.

```bash
# WordPress
curl -Ik -H "Host: campusvirtual.conred.gob.gt" https://<dns-del-alb>/

# Moodle
curl -Ik -H "Host: aulavirtual.campusvirtual.conred.gob.gt" https://<dns-del-alb>/
```

O `/etc/hosts` apuntando los FQDN a una IP del ALB y abrir en browser.

---

## 8. Redirect desde la URL vieja de Moodle

Cuando campusvirtual (WP) ya esté en AWS, en nginx de WP (o regla ALB path):

```nginx
# En el server block de campusvirtual.conred.gob.gt
location ^~ /aulavirtualconred {
    return 301 https://aulavirtual.campusvirtual.conred.gob.gt$request_uri;
}
```

Ajustar si Moodle no debe reenviar el path `/aulavirtualconred` (a veces conviene `return 301 https://aulavirtual.campusvirtual.conred.gob.gt/;`).

---

## 9. Prueba de humo

### WordPress

1. EC2 **healthy** en `tg-wordpress`.  
2. Home `https://campusvirtual.conred.gob.gt/` (o curl con Host).  
3. Login wp-admin.  
4. Una imagen de `uploads` carga (EFS ok).  
5. Plugins custom críticos OK.

### Moodle

1. EC2 **healthy** en `tg-moodle`.  
2. Home / login en `https://aulavirtual.campusvirtual.conred.gob.gt/`.  
3. Curso / archivo de `moodledata` visible.  
4. Cron: tras ~2 min, en admin → notificaciones de cron reciente.  
5. Sin residuales de la URL vieja en enlaces principales.

### RDS / red

- WP no debe poder `USE moodle` con `wp_app` (y viceversa).  
- CloudWatch: CPU RDS, conexiones, disco EFS.

---

## 10. Cutover DNS

1. Bajar TTL del DNS actual (24–48 h antes).  
2. Ventana de mantenimiento: modo mantenimiento en Plesk.  
3. Sync **final** BD (dump incremental o mysqldump fresco) + `rsync` final uploads/moodledata.  
4. Apuntar:

   | Registro | Destino |
   |----------|---------|
   | `campusvirtual.conred.gob.gt` | ALB |
   | `aulavirtual.campusvirtual.conred.gob.gt` | ALB (mismo) |

5. Validar ambos sitios + cron.  
6. Rollback: revertir DNS a Plesk.

Detalle más adelante: [cutover.md](cutover.md).

---

## 11. Orden de trabajo resumido

| # | Acción | Resultado |
|---|--------|-----------|
| 1 | Recibir dumps + configs + ficheros del cliente | Material listo |
| 2 | VPC / SG (`sg-alb`, `sg-wp`, `sg-moodle`, `sg-rds`, `sg-efs`) | Red |
| 3 | RDS MySQL/MariaDB privado | Endpoint |
| 4 | Crear DBs `wordpress` + `moodle` y users | Privilegios OK |
| 5 | Restore dumps | Datos en RDS |
| 6 | EFS + rsync uploads + moodledata | Ficheros |
| 7 | EC2 WP + nginx/PHP + `wp-config` | App WP |
| 8 | EC2 Moodle + `config.php` + URL replace + cron | App Moodle |
| 9 | ACM + ALB host rules | Entrada HTTPS |
| 10 | Prueba Host header / smoke | PoC OK |
| 11 | Redirect `/aulavirtualconred` | Enlaces viejos |
| 12 | Cutover DNS | Producción |

---

## 12. Secrets y naming sugerido

| Secret / recurso | Nombre ejemplo |
|------------------|----------------|
| Cluster lógico | `conred-campusvirtual` |
| RDS id | `conred-campus-mysql` |
| EFS | `conred-campus-files` |
| SM WP DB | `conred/campusvirtual/wordpress/db` |
| SM Moodle DB | `conred/campusvirtual/moodle/db` |
| Log groups | `/ec2/campusvirtual/wordpress`, `/ec2/campusvirtual/moodle` |

---

## 13. Fuera de alcance de este passo

- Tablero Django / Fargate (runbook propio).  
- Dockerización Moodle/WP (fase 2).  
- Upgrade mayor de Moodle o WP.  
- MGN / lift del server Plesk completo.

---

## 14. Contacto / artefactos repo

| Artefacto | Ubicación |
|-----------|-----------|
| AS-IS | `docs/as-is/arquitectura.md` |
| ADR migración | `docs/decisiones/ADR-001-estrategia-migracion.md` |
| Plantilla Moodle config | `config.example.php` |
| Q&A discovery | `Respuesta.txt` |
| Runbook tablero | `docs/runbooks/leo-tablero-fargate-rds.md` |

Si algo bloquea (restore motor, EFS throughput, plugins custom), anotar el error exacto y fecha en este repo o issue interno.
