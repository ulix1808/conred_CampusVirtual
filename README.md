# conred_CampusVirtual

Documentación y artefactos de la **migración a AWS** del Campus Virtual de CONRED.

Repo: https://github.com/ulix1808/conred_CampusVirtual

## Estructura

```
docs/                 Documentación AS-IS, ADRs, diseño AWS, runbooks
TableroInform/        Código Django del tablero (sin venv)
Respuesta.txt         Q&A discovery
cron.php              Referencia cron Moodle
config.example.php    Plantilla Moodle (sin secretos)
assets/               Capturas / diagramas
```

## Componentes

| Servicio | URL | Stack |
|----------|-----|--------|
| **WordPress** | `campusvirtual.conred.gob.gt` | WP 7.0.1 · PHP 8.3 · MySQL |
| **Moodle** | `aulavirtual.campusvirtual.conred.gob.gt` (hoy: path `/aulavirtualconred`) | Moodle 5.0.2 · PHP 8.3 · MariaDB/MySQL · nginx |
| **Tablero Python** | `tableroinformguatemala.conred.gob.gt` | Django 3.2 · Python 3.9 · PostgreSQL |
| **ArcGIS** | `sig.conred.gob.gt` | Enterprise 11.3 · 3 VPS Ubuntu 20.04 · [AS-IS](docs/as-is/arcgis.md) |

## Runbooks

- [ArcGIS Enterprise → 3 EC2 + ALB + WebGISDR (Leo)](docs/runbooks/leo-arcgis-aws.md)
- [Moodle + WordPress → EC2 + 1 RDS + ALB (Leo)](docs/runbooks/leo-moodle-wordpress-rds.md)
- [Tablero Inform → Fargate + RDS (Leo)](docs/runbooks/leo-tablero-fargate-rds.md)

## Seguridad

**No** van al repo:

- `.env` / `TableroInform/src/.env`
- `config.php` real (usar `config.example.php`)
- CSV / access keys de AWS

Copia local: `cp config.example.php config.php` y llena valores.  
Tablero: `cp TableroInform/src/.env_exemple TableroInform/src/.env`.
