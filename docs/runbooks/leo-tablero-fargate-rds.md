# Instrucciones para Leo — Tablero Inform en Fargate + RDS

Guía operativa para desplegar el **Tablero Python** (`tableroinformguatemala.conred.gob.gt`) en:

- **App:** contenedor en **Amazon ECS / Fargate**
- **BD:** **Amazon RDS for PostgreSQL**
- **Imagen:** **Docker Hub** (flujo habitual del equipo). **ECR no es obligatorio** — Fargate puede hacer pull desde Docker Hub.

Cuenta AWS: `631394011641` (CONRED).  
Usuario IAM de trabajo: `leonardo.villasenor`.

> **Importante:** para CLI/SDK necesitas **Access Key ID + Secret Access Key**. Solo el Access Key ID no alcanza. No subas secretos al repo ni a la imagen Docker.

### Docker Hub → Fargate (sin ECR)

| Origen de imagen | ¿Fargate puede usarla? |
|------------------|------------------------|
| Docker Hub **público** | Sí — en la task: `usuario/repo:tag` |
| Docker Hub **privado** | Sí — Secrets Manager con user/password de Hub + `repositoryCredentials` en la task definition |
| Amazon ECR | Opcional (alternativa nativa AWS) |

ECR **no se necesita** si la imagen ya vive en Docker Hub. Las tasks sí necesitan salida a internet (NAT o subnet pública) para hacer `docker pull` de Hub.

---

## 0. Qué hay hoy (contexto)

| Ítem | Valor |
|------|--------|
| App | Django 3.2 · Python 3.9 · código en `TableroInform/src/` |
| Config | variables de entorno (`SECRET_KEY`, `DEBUG`, `ALLOWED_HOSTS`, `DB_*`) |
| BD origen | PostgreSQL **9.2.24** (Plesk) |
| Dump | `TableroInform/DBackup2026_tableroInform/dump-tableroi_db-202607131132.sql` |
| Dependencias | `TableroInform/requirements.txt` (+ falta `django-cors-headers` y `gunicorn` en el build) |
| Moodle / WordPress | **No** se usan en tiempo real; el tablero tiene datos propios |

### Variables de entorno del contenedor (`settings.py`)

**Mínimo obligatorio en Fargate + RDS:**

```text
SECRET_KEY=...
ALLOWED_HOSTS=<dominio>,<dns-del-alb>
DB_NAME=...
DB_USER=...
DB_PASS=...
DB_HOST=<endpoint-rds>
```

| Variable | ¿Obligatoria? | Nota |
|----------|---------------|------|
| `SECRET_KEY` | **Sí** | Sin ella Django no arranca |
| `ALLOWED_HOSTS` | **Sí** en prod | Default vacío → `DisallowedHost` |
| `DB_HOST` / `DB_NAME` / `DB_USER` / `DB_PASS` | **Sí** en Fargate | Defaults apuntan a localhost / `hola` |
| `DEBUG` | No | Default `False` |
| `DB_ENGINE` | No | Default `django.db.backends.postgresql_psycopg2` |
| `DB_PORT` | No | Default `5432` |
| `EMAIL_*` | No | No hacen falta para levantar el tablero |

Lista completa soportada (incluye opcionales):

```text
SECRET_KEY
DEBUG=False
ALLOWED_HOSTS=<dominio-o-ALB>
DB_ENGINE=django.db.backends.postgresql_psycopg2
DB_NAME=...
DB_USER=...
DB_PASS=...
DB_HOST=<endpoint-rds>
DB_PORT=5432
```

---

## 1. Preparar acceso AWS (1 vez)

1. Entrar a la consola con tu usuario IAM (o Identity Center).
2. IAM → tu usuario → **Security credentials** → **Create access key**.
3. Guardar en un lugar seguro (1Password / Secrets Manager local):
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`
4. En tu laptop:

```bash
aws configure --profile conred
# region sugerida: us-east-1 (confirmar con arquitectura CONRED)
aws sts get-caller-identity --profile conred
```

Permisos mínimos que vas a necesitar (o rol Admin en la cuenta de PoC):

- VPC / EC2 (SG, subnets)
- RDS
- ECR (solo si eligen esa alternativa; **no requerido** con Docker Hub)
- ECS
- Elastic Load Balancing
- IAM (task roles)
- Secrets Manager (recomendado; obligatorio si Hub privado o secretos de app)
- CloudWatch Logs

---

## 2. Red (VPC) — decidir dónde vive todo

Usar una VPC existente de CONRED **o** crear una PoC.

Necesitas:

| Recurso | Uso |
|---------|-----|
| 2+ subnets **privadas** (AZs distintas) | RDS + tasks Fargate |
| 2+ subnets **públicas** | ALB (y NAT si las tasks van a privadas) |
| NAT Gateway (si Fargate en privada) | Salida a internet (**Docker Hub / ECR pull**, updates) |
| Security Group `sg-alb` | Inbound 80/443 desde internet (o VPN) |
| Security Group `sg-ecs` | Inbound **8000** (o el puerto del contenedor) **solo desde `sg-alb`** |
| Security Group `sg-rds` | Inbound **5432** **solo desde `sg-ecs`** |

Regla de oro: RDS **no** debe ser público. Solo alcanzable desde las tasks.

---

## 3. Crear RDS PostgreSQL

1. RDS → **Create database**.
2. Valores sugeridos PoC:

| Campo | Sugerencia |
|-------|------------|
| Engine | PostgreSQL |
| Version | **14.x o 15.x** (9.2 está EOL; probar restore y app) |
| Template | Dev/Test para PoC |
| DB instance id | `conred-tablero-pg` |
| Master username | (crear; no reutilizar password de prod en chats) |
| Instance | `db.t4g.micro` / `db.t3.micro` (PoC) |
| Storage | 20–50 GB gp3 |
| VPC / subnets | las privadas del paso 2 |
| Public access | **No** |
| Security group | `sg-rds` |
| Initial DB name | `tableroi_db` (o el del dump) |

3. Esperar a que quede **Available**.
4. Anotar el **Endpoint** → será `DB_HOST`.

### 3.1 Restaurar el dump

Desde una máquina que tenga ruta a RDS (bastion / VPN / ECS Exec / instancia temporal en la misma VPC):

```bash
# Ejemplo (ajustar usuario, host y archivo)
psql "host=<RDS_ENDPOINT> port=5432 dbname=tableroi_db user=<master> sslmode=require" \
  -f dump-tableroi_db-202607131132.sql
```

Notas:

- Si el dump es de **9.2**, puede haber warnings al restaurar en 14/15. Documentar errores y escalar si falla el esquema.
- Alternativa si el restore falla: DB vacía + `python manage.py migrate` + scripts en `TableroInform/srcipts_sql/` (pierdes/alineas datos a mano).
- Verificar:

```bash
psql "host=<RDS_ENDPOINT> ..." -c '\dt'
```

---

## 4. Empaquetar la app (Dockerfile)

Trabajar sobre el código de `TableroInform` (o el repo GitLab `apps-conred/tablero_inform`).

### 4.1 Checklist de código antes del build

- [ ] Añadir a dependencias de imagen: `gunicorn`, `django-cors-headers` (está en `INSTALLED_APPS` pero no en `requirements.txt`).
- [ ] Definir `STATIC_ROOT` y decidir estáticos (WhiteNoise o nginx sidecar / S3) — hoy no hay `STATIC_ROOT`.
- [ ] **No** copiar `src/.env` a la imagen.
- [ ] `WORKDIR` = carpeta donde está `manage.py` (`src/`).
- [ ] Comando de arranque tipo:

```bash
gunicorn maps.wsgi:application --bind 0.0.0.0:8000 --workers 2
```

### 4.2 Dockerfile de referencia (Leo / desarrollo)

Crear `TableroInform/Dockerfile` (ajustar si el build context cambia):

```dockerfile
FROM python:3.9-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    libpq-dev gcc \
 && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt \
    gunicorn \
    django-cors-headers

COPY src/ /app/

EXPOSE 8000
CMD ["gunicorn", "maps.wsgi:application", "--bind", "0.0.0.0:8000", "--workers", "2"]
```

Validar en local (opcional pero muy recomendado):

```bash
docker build -t conred-tablero:local .
docker run --rm -p 8000:8000 \
  -e SECRET_KEY=test \
  -e DEBUG=True \
  -e ALLOWED_HOSTS=localhost,127.0.0.1 \
  -e DB_ENGINE=django.db.backends.postgresql_psycopg2 \
  -e DB_NAME=tableroi_db \
  -e DB_USER=... \
  -e DB_PASS=... \
  -e DB_HOST=host.docker.internal \
  -e DB_PORT=5432 \
  conred-tablero:local
```

---

## 5. Subir la imagen → Docker Hub (camino principal)

**No se requiere ECR.** Flujo del equipo: build local → push a Docker Hub → Fargate hace pull de esa imagen.

### 5.1 Push a Docker Hub

```bash
# Desde TableroInform/ (contexto del Dockerfile)
docker login
docker build -t <dockerhub-user>/conred-tablero-inform:latest .
docker push <dockerhub-user>/conred-tablero-inform:latest
```

- Repo **público:** la task de Fargate usa la imagen directamente: `<dockerhub-user>/conred-tablero-inform:latest`
- Repo **privado:** crear en Secrets Manager un secret JSON con usuario/password (o access token) de Docker Hub y referenciarlo en la task definition como **private registry authentication** (`repositoryCredentials`). El *task execution role* necesita `secretsmanager:GetSecretValue` sobre ese secret.

### 5.2 Alternativa opcional — Amazon ECR

Solo si más adelante quieren dejar de usar Hub:

```bash
AWS_ACCOUNT=631394011641
REGION=us-east-1
REPO=conred-tablero-inform

aws ecr create-repository --repository-name $REPO --region $REGION --profile conred

aws ecr get-login-password --region $REGION --profile conred \
 | docker login --username AWS --password-stdin ${AWS_ACCOUNT}.dkr.ecr.${REGION}.amazonaws.com

docker build -t $REPO:latest .
docker tag $REPO:latest ${AWS_ACCOUNT}.dkr.ecr.${REGION}.amazonaws.com/$REPO:latest
docker push ${AWS_ACCOUNT}.dkr.ecr.${REGION}.amazonaws.com/$REPO:latest
```

---

## 6. Secretos de la aplicación

No poner passwords en la task definition en claro si se puede evitar.

1. Secrets Manager → secret JSON de **app + BD**, ejemplo (mínimo):

```json
{
  "SECRET_KEY": "...",
  "DB_USER": "...",
  "DB_PASS": "...",
  "DB_HOST": "<rds-endpoint>",
  "DB_NAME": "tableroi_db"
}
```

(`DB_PORT` / `DB_ENGINE` / `DEBUG` opcionales; usan defaults de `settings.py`.)

2. Si Docker Hub es **privado**, otro secret (o el mismo archivo documentado) con credenciales del registry para `repositoryCredentials`.
3. El *task execution role* debe poder `secretsmanager:GetSecretValue`.

Variables no secretas como env normales: `ALLOWED_HOSTS=tableroinformguatemala.conred.gob.gt,<dns-del-alb>`.

---

## 7. ECS Fargate — cluster, task y servicio

### 7.1 Cluster

ECS → **Create cluster** → Networking only (Fargate) → nombre `conred-tablero`.

### 7.2 Task definition

| Campo | Valor sugerido |
|-------|----------------|
| Launch type | **Fargate** |
| OS/Arch | Linux / X86_64 (o ARM si la imagen es arm64) |
| CPU / Memoria | 0.5 vCPU / 1 GB (PoC) |
| Task execution role | rol con logs + Secrets Manager (+ pull Hub privado si aplica) |
| Task role | rol de la app (mínimo) |
| Container image | **URI Docker Hub** del paso 5: `<user>/conred-tablero-inform:tag` |
| Private registry auth | Solo si el repo de Hub es privado (`repositoryCredentials`) |
| Port mapping | **8000** TCP |
| Env / Secrets | mínimo del §0 + paso 6 |
| CloudWatch Logs | activar (`/ecs/conred-tablero`) |

Health check opcional del contenedor: HTTP `GET /` en puerto 8000 (confirmar ruta real).

### 7.3 Application Load Balancer

1. Crear ALB en subnets **públicas**, SG `sg-alb`.
2. Target group: tipo **IP**, puerto **8000**, health check `/` (o la ruta que responda 200).
3. Listener 80 → target group (luego 443 + certificado ACM).

### 7.4 Service

| Campo | Valor |
|-------|--------|
| Cluster | `conred-tablero` |
| Launch type | Fargate |
| Task definition | la del 7.2 |
| Desired count | 1 (PoC) |
| Subnets | **privadas** |
| Security group | `sg-ecs` |
| Public IP | OFF si hay NAT; ON solo si PoC sin NAT (menos ideal) |
| Load balancer | ALB + target group del 7.3 |

---

## 8. Prueba de humo

1. Tasks en estado **RUNNING**.
2. Target group: targets **healthy**.
3. Abrir `http://<dns-del-alb>/` (mapa / login del tablero).
4. Revisar CloudWatch Logs si falla:
   - error de conexión a RDS → SG / subnet / user / password
   - `DisallowedHost` → falta el host en `ALLOWED_HOSTS`
   - static 404 → falta `STATIC_ROOT` / WhiteNoise / pipeline de estáticos
5. (Opcional) `manage.py migrate` solo si la BD se creó vacía; con dump restaurado normalmente **no** hace falta.

---

## 9. Cutover DNS (cuando PoC esté OK)

1. Validar funcionalidad vs producción actual.
2. Certificado ACM para `tableroinformguatemala.conred.gob.gt`.
3. Listener HTTPS en ALB.
4. Cambiar DNS del dominio → ALB (o CloudFront delante si aplica).
5. Mantener rollback: volver DNS al origen Plesk.

---

## 10. Orden de trabajo resumido (para Leo)

| # | Acción | Resultado |
|---|--------|-----------|
| 1 | Access key completa + `aws sts get-caller-identity` | CLI lista |
| 2 | VPC / SG (`sg-alb`, `sg-ecs`, `sg-rds`) | Red lista |
| 3 | Crear RDS PostgreSQL (privado) | Endpoint `DB_HOST` |
| 4 | Restaurar dump y validar tablas | Datos listos |
| 5 | Dockerfile + build local | Imagen corre |
| 6 | Push a **Docker Hub** (ECR opcional) | Imagen disponible para Fargate |
| 7 | Secrets Manager + task definition | Secrets fuera de la imagen |
| 8 | ALB + ECS Service Fargate (pull desde Hub) | App publicada |
| 9 | Prueba de humo + logs | PoC OK |
| 10 | DNS / TLS | Cutover |

---

## 11. Fuera de alcance de este passo

- Moodle y WordPress (otro track: MySQL → RDS, posible contenedor/EC2).
- Upgrade mayor de Django o refactor del código.
- Alta disponibilidad multi-AZ de producción (se puede endurecer después del PoC).

---

## 12. Contacto / artefactos

| Artefacto | Ubicación |
|-----------|-----------|
| Código local tablero | `TableroInform/` |
| Dump BD | `TableroInform/DBackup2026_tableroInform/` |
| SQL auxiliares | `TableroInform/srcipts_sql/` |
| Q&A discovery | `Respuesta.txt` (carpeta Conred) |
| Repo docs migración | https://github.com/ulix1808/conred_CampusVirtual |

Si algo bloquea (restore 9.2→14, estáticos, CORS), documentar el error exacto en este repo bajo `docs/runbooks/` o un issue interno.
