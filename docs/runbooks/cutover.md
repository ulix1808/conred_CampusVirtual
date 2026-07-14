# Runbook — Cutover (plantilla)

Estado: borrador vacío hasta firmar estrategia.

## Pre-cutover

- [ ] Backup verificado (BD + ficheros)
- [ ] RDS en target acepta conexiones desde app
- [ ] DNS TTL bajado
- [ ] Ventana de mantenimiento acordada
- [ ] Plan de rollback escrito y probado en ensayo

## Cutover

1. Modo mantenimiento en origen (Moodle/WP).
2. Sync final BD + ficheros.
3. Apuntar apps a RDS / storage AWS.
4. Cambiar DNS / ALB.
5. Validar login Moodle, home WP, tablero Django.
6. Confirmar cron Moodle.

## Rollback

1. Revertir DNS al origen.
2. Reactivar servicios en Plesk.
3. Documentar causa y gap de datos.
