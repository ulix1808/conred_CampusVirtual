# Diseño target AWS (borrador)

> Borrador de trabajo. Ajustar tras firmar ADR-001.

## Capas propuestas

| Capa | Servicio AWS | Notas |
|------|----------------|-------|
| DNS / TLS | Route 53 + ACM (o DNS externo → ALB) | `campusvirtual` y `tablero` |
| Entrada | ALB / NLB | Path o host-based routing |
| App Moodle/WP | EC2 o ECS/Fargate | Depende de decisión de contenedores |
| App Tablero | EC2 o ECS | Django + gunicorn/uwsgi detrás de nginx |
| BD relacional | **RDS** MySQL/MariaDB (Moodle, WP) | Instancias separadas o multi-DB según aislamiento |
| BD Tablero | **RDS PostgreSQL** (versión soportada) | Migrar desde 9.2 con plan de upgrade |
| Ficheros | EBS / **EFS** / S3 | `moodledata` ~349 MB; uploads WP ~50 GB |
| Secretos | Secrets Manager / SSM | Sustituir `config.php` / `.env` en claro |
| Observabilidad | CloudWatch (+ APM si aplica) | Logs PHP-FPM, nginx, Django, cron |
| Backup | RDS snapshots + backup de volúmenes/S3 | Probar restore antes de cutover |

## Flujos a diseñar

1. Moodle → RDS + volumen `dataroot` + cron.
2. WordPress → RDS + estrategia uploads 50 GB.
3. Django → RDS PostgreSQL upgraded + variables de entorno.
4. Cutover DNS y rollback.

## Checklist de validación

- [ ] PoC restore Moodle BD en RDS
- [ ] PoC restore WordPress BD en RDS
- [ ] PoC PostgreSQL 9.2 → versión target
- [ ] Imagen/container Moodle con volumen persistente
- [ ] Imagen/container WordPress + plugins custom
- [ ] Medición tiempo de sync de uploads ~50 GB
- [ ] Cron Moodle equivalente en AWS
