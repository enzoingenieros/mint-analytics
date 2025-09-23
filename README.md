# Mint Analytics

Sistema de análisis y gestión para MicroGES.

## Requisitos previos

- Docker
- Docker Compose

## Instalación

### 1. Clonar el repositorio

```bash
git clone git@github.com:enzoingenieros/mint-analytics.git
cd mint-analytics
```

### 2. Configuración del entorno

Crea un archivo `.env` en la raíz del proyecto con las siguientes variables de entorno:

```bash
POSTGRES_USER=postgres
POSTGRES_PASSWORD=postgres
POSTGRES_DB=microges
```

### 3. Configuración de la base de datos

**Importante:** Debes copiar el archivo de backup de la base de datos `microges.backup` en la carpeta `backups/`:

```bash
cp /ruta/a/tu/microges.backup backups/microges.backup
```

El backup de la base de datos PostgreSQL se restaurará automáticamente al iniciar el contenedor.

### 4. Levantar el proyecto

```bash
docker compose up -d
```

Este comando:
- Levanta un contenedor PostgreSQL en el puerto 5432
- Restaura automáticamente el backup de la base de datos desde `backups/microges.backup`
- La base de datos estará disponible con las siguientes credenciales:
  - **Host:** localhost
  - **Puerto:** 5432
  - **Base de datos:** microges
  - **Usuario:** postgres
  - **Contraseña:** postgres

### 5. Verificar el estado

```bash
docker compose ps
```

### 6. Ver logs

```bash
docker compose logs -f
```

## Detener el proyecto

```bash
docker compose down
```

Para eliminar también los volúmenes (esto borrará todos los datos):

```bash
docker compose down -v
```

## Estructura del proyecto

```
mint-analytics/
├── backups/           # Backups de la base de datos
│   └── microges.backup
├── init/              # Scripts de inicialización
│   └── restore.sh     # Script para restaurar el backup
├── compose.yml        # Configuración de Docker Compose
└── README.md          # Este archivo
```

## Notas

- El backup de la base de datos se restaura automáticamente la primera vez que se levanta el contenedor
- Los datos persisten en un volumen Docker llamado `postgres_data`