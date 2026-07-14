# ADR-001 — Estrategia de migración Campus Virtual

- **Estado:** Propuesto  
- **Fecha:** 2026-07-14  

## Contexto

Hay tres workloads (Moodle, WordPress, Tablero Django) hoy en Plesk. Se debe llevar a AWS considerando RDS, posible containerización y EC2, eligiendo entre reinstalar, AWS MGN o lift-and-shift.

## Opciones

### A — Reinstalación limpia + restore

- Instalar Moodle/WP/Django en AMI o contenedores nuevos.
- Migrar BD (dump/restore o DMS) y ficheros (`moodledata`, `uploads`).
- **Pros:** Target limpio, versiones controladas, buena base para contenedores/RDS.  
- **Contras:** Más trabajo de validación de plugins/temas; ventana de pruebas larga.

### B — AWS Application Migration Service (MGN)

- Replicar VMs/servidores origen y cutover.
- **Pros:** Rápido para lift de OS completo.  
- **Contras:** Arrastra deuda (Plesk, Python/Postgres viejos); containerización post-migración.

### C — Lift-and-shift mínimo (EC2 + volúmenes)

- Copiar stack “casi igual” a EC2 sin rehacer apps.
- **Pros:** Menor cambio funcional inmediato.  
- **Contras:** Poca modernización; PostgreSQL 9.2 y Plesk siguen siendo lastre.

### D — Híbrido (recomendación inicial a validar)

| Componente | Enfoque tentativo |
|------------|-------------------|
| Moodle | Reinstalar (oficial/container) + RDS MySQL/MariaDB + EFS/EBS para `dataroot` |
| WordPress | Reinstalar + RDS + almacenamiento uploads (EFS o S3+plugin) |
| Tablero Django | Reinstalar/container + **upgrade** PostgreSQL en RDS |

## Decisión

_Pendiente de validación con CONRED / arquitectura._

## Consecuencias (cuando se firme)

- Definirá runbooks de cutover, RTO/RPO y si MGN entra solo para un host de respaldo.
