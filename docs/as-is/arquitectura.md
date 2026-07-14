# Estado actual (AS-IS)

## Resumen

Campus Virtual opera como aplicación **monolítica** en hosting **Plesk**, con Moodle + WordPress en el mismo servidor web y un tablero Django aparte.

```
Internet
   │
   ▼
Plesk (nginx + PHP-FPM / procesos app)
   ├── campusvirtual.conred.gob.gt
   │     ├── Moodle 5.0.2  → MariaDB/MySQL (localhost)
   │     └── WordPress 7.0.1 → MySQL (localhost)  [sitio informativo]
   └── tableroinformguatemala.conred.gob.gt
         └── Django 3.2.4 → PostgreSQL 9.2 :5432
```

## Moodle

| Ítem | Valor |
|------|--------|
| URL | `https://campusvirtual.conred.gob.gt/aulavirtualconred` |
| Versión | Moodle 5.0.2 (Build 20250811, rama 5.0 estable) |
| PHP | 8.3.32 (FPM) |
| Web | nginx |
| BD | MariaDB (`moodle`), prefijo `mdl_` |
| Host BD AS-IS | `localhost` |
| `dataroot` | `/var/www/vhosts/campusvirtual.conred.gob.gt/moodledata` (~349 MB) |
| Cron | cada minuto vía CLI PHP 8.3 de Plesk |
| LDAP / SSO / SMTP | No reportado |
| Comparte BD/auth con WP | No |

### Cron (referencia)

```text
* * * * * /opt/plesk/php/8.3/bin/php \
  /var/www/vhosts/campusvirtual.conred.gob.gt/httpdocs/aulavirtualconred/admin/cli/cron.php \
  >/dev/null 2>&1
```

Usuario crontab reportado: `campusvirtual.conred_6tddjsmcntx` en host `vmi1102881`.

## WordPress

| Ítem | Valor |
|------|--------|
| Rol | Sitio informativo (sin SSO/APIs hacia Moodle) |
| Versión | 7.0.1 |
| PHP | 8.3.32 (FPM) · nginx |
| BD | ~250 MB |
| Uploads (`wp-content/uploads`) | ~50 GB |
| Plugins / temas | Personalizados (detalle pendiente de inventario) |

## Tablero Python (Django)

| Ítem | Valor |
|------|--------|
| URL | `https://tableroinformguatemala.conred.gob.gt` |
| Framework | Django 3.2.4 |
| Python | 3.9.5 |
| BD | PostgreSQL 9.2.24 · puerto 5432 · backend `postgresql_psycopg2` |
| Datos | Propios (no depende de Moodle/WP en tiempo real) |
| Repo origen | GitLab privado `apps-conred/tablero_inform` |
| Config | Variables de entorno (BD + `ALLOWED_HOSTS` / orígenes) |

## Hosting

- Despliegue: **Plesk** (administración de servidores y alojamiento web).
- Moodle y WordPress comparten el entorno de hosting del campus virtual; el tablero está en vhost separado.
