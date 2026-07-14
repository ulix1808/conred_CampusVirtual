# Objetivos y preguntas abiertas

Derivado del discovery del proyecto **Campus Virtual** (ítem 7 del portafolio CONRED).

## Objetivos técnicos

1. **RDS:** Validar migración de MySQL/MariaDB de Moodle y WordPress a Amazon RDS.
2. **Contenedores:** Evaluar Dockerización de Moodle y WordPress (factibilidad, volúmenes, cron, `moodledata`, uploads).
3. **Cómputo:** Definir rol de **EC2** (VM monolitica, nodos Docker, o híbrido).
4. **Estrategia de migración** (elegir una o combinar por componente):
   - Reinstalación limpia en AWS + restore de datos
   - **AWS MGN** (replicación de servidor)
   - **Lift-and-shift** (mover “as-is” con cambios mínimos)

## Componentes en alcance

- `campusvirtual.conred.gob.gt` — Moodle + WordPress  
- `tableroinformguatemala.conred.gob.gt` — Tablero Django + PostgreSQL  

## Riesgos tempranos

| Riesgo | Impacto | Nota |
|--------|---------|------|
| PostgreSQL 9.2 EOL | Alto | Target debe ser versión soportada en RDS/Aurora; plan de upgrade |
| Uploads WP ~50 GB | Medio | Tiempo de copia, costos EFS/S3, cutover |
| Plugins/temas custom WP | Medio | Inventariar antes de containerizar |
| Cron Moodle cada minuto | Bajo–Medio | Replicar en ECS Scheduled Task / systemd / EventBridge |
| Secretos en archivos planos | Alto | No llevar `config.php` / CSV AWS al repo ni a imágenes |

## Decisiones pendientes

Ver [docs/decisiones/ADR-001-estrategia-migracion.md](../decisiones/ADR-001-estrategia-migracion.md).
