# conred_CampusVirtual

Documentación de la **migración a AWS** del Campus Virtual de CONRED.

## Alcance

Arquitectura monolítica actual (2–3 servicios) sobre Plesk:

| Servicio | URL | Stack |
|----------|-----|--------|
| **Moodle** | [campusvirtual.conred.gob.gt](https://campusvirtual.conred.gob.gt) | Moodle 5.0.2 · PHP 8.3 · MariaDB/MySQL · nginx (FPM) |
| **WordPress** | mismo dominio / sitio informativo | WordPress 7.0.1 · PHP 8.3 · MySQL · nginx (FPM) |
| **Tablero Python** | [tableroinformguatemala.conred.gob.gt](https://tableroinformguatemala.conred.gob.gt) | Django 3.2.4 · Python 3.9.5 · PostgreSQL 9.2 |

No hay integración en tiempo real entre Moodle/WordPress y el tablero (datos propios).

## Objetivos de migración

1. Validar migración de BD Moodle (MySQL) y WordPress (MySQL) → **Amazon RDS**.
2. Validar si Moodle y WordPress pueden **containerizarse**.
3. Definir cómputo en **EC2** (y/o contenedores).
4. Elegir estrategia: **reinstalar** · **AWS MGN** · **lift-and-shift**.

## Estructura del repo

```
docs/
  as-is/          Inventario y estado actual
  decisiones/     ADRs y elección de estrategia
  aws/            Diseño target (VPC, RDS, EC2, etc.)
  runbooks/       Procedimientos de corte / rollback
  inventario/     Hallazgos sanitizados (sin secretos)
assets/           Diagramas y capturas
```

## Estado

| Fase | Estado |
|------|--------|
| Descubrimiento / inventario | En curso |
| Decisión de estrategia | Pendiente |
| Diseño AWS | Pendiente |
| PoC contenedores / RDS | Pendiente |
| Migración | Pendiente |

## Seguridad

- **No** versionar contraseñas, `.env`, CSV de consolas AWS ni `config.php` con credenciales reales.
- Usar plantillas (`*.example`) y AWS Secrets Manager / Parameter Store en el target.

## Referencias internas

- Código / detalle del tablero (GitLab privado): `gitlab.com/apps-conred/tablero_inform`
- App similar CONRED ya en GitHub: `Conred_Reclutamiento`
