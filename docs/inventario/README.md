# Inventario sanitizado

Fuente: discovery interno (`Respuesta.txt` y configuración local). **Sin secretos.**

## Credenciales y config

| Artefacto | ¿En repo? | Dónde debe vivir |
|-----------|-----------|------------------|
| `config.php` Moodle (dbpass, etc.) | **No** | Secrets Manager; plantilla `config.php.example` |
| CSV / consolas AWS personales | **No** | IAM Identity Center / usuarios IAM del cliente |
| `.env` Django | **No** | SSM / Secrets Manager |
| GitLab `tablero_inform` | Solo enlace | Acceso al equipo CONRED |

## Plantillas sugeridas (por crear)

- `docs/inventario/moodle-config.example.php` — claves sin valores secretos
- `docs/inventario/django.env.example` — nombres de variables

## Tamaños y rutas

| Recurso | Valor |
|---------|--------|
| moodledata | `/var/www/vhosts/campusvirtual.conred.gob.gt/moodledata` · ~349 MB |
| WP uploads | ~50 GB |
| WP BD | ~250 MB |
| Host Plesk reportado | `vmi1102881` |

## ArcGIS (`sig.conred.gob.gt`)

Ver [docs/as-is/arcgis.md](../as-is/arcgis.md). Resumen:

| Rol | IP | Componente |
|-----|-----|------------|
| Portal + Web Adaptor | `94.72.113.246` | Portal 11.3, Web Adaptor Java |
| Server + GeoEvent | `94.72.113.72` | ArcGIS Server 11.3, GeoEvent 11.3 |
| Data Store | `207.244.239.174` | Relational Data Store (PostgreSQL 15.5 interno) · ~53 GB usados en disco |

## Código local de referencia (workspace)

El folder de trabajo local puede contener copias de `config.php`, `cron.php` y datos del tablero; **no se versionan** en este repositorio.
