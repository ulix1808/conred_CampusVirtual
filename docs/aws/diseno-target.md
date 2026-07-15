# Diseño target AWS (borrador)

> Borrador de trabajo. Ajustar tras firmar ADR-001.

## Capas propuestas

| Capa | Servicio AWS | Notas |
|------|----------------|-------|
| DNS / TLS | Route 53 + ACM (o DNS externo → ALB) | `campusvirtual`, `aulavirtual.campusvirtual`, `tablero` |
| Entrada | ALB | Host rules: WP vs Moodle vs tablero |
| App WordPress | EC2 (+ nginx/PHP 8.3) | `campusvirtual.conred.gob.gt` |
| App Moodle | EC2 (+ nginx/PHP 8.3) | `aulavirtual.campusvirtual.conred.gob.gt` |
| App Tablero | ECS/Fargate | Django + gunicorn |
| BD Moodle+WP | **1 RDS** MySQL/MariaDB | Dos databases (`wordpress`, `moodle`) + usuarios distintos |
| BD Tablero | **RDS PostgreSQL** (versión soportada) | Migrar desde 9.2 con plan de upgrade |
| Ficheros | EBS / **EFS** / S3 | `moodledata` ~349 MB; uploads WP ~50 GB |
| Secretos | Secrets Manager / SSM | Sustituir `config.php` / `.env` en claro |
| Observabilidad | CloudWatch (+ APM si aplica) | Logs PHP-FPM, nginx, Django, cron |
| Backup | RDS snapshots + backup de volúmenes/S3 | Probar restore antes de cutover |

## Flujos a diseñar

1. Moodle → subdominio nuevo + RDS (BD `moodle`) + EFS `dataroot` + cron.
2. WordPress → dominio campusvirtual + misma RDS (BD `wordpress`) + EFS uploads ~50 GB.
3. Django → RDS PostgreSQL upgraded + Fargate (runbook aparte).
4. Cutover DNS / ALB host rules y rollback.

## Checklist de validación

- [ ] PoC restore Moodle BD en RDS
- [ ] PoC restore WordPress BD en RDS
- [ ] PoC PostgreSQL 9.2 → versión target
- [ ] Imagen/container Moodle con volumen persistente
- [ ] Imagen/container WordPress + plugins custom
- [ ] Medición tiempo de sync de uploads ~50 GB
- [ ] Cron Moodle equivalente en AWS
