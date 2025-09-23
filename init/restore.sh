#!/bin/bash
set -e

# Crear la base de datos para Metabase si no existe
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname postgres <<-EOSQL
    CREATE DATABASE metabase_app;
    GRANT ALL PRIVILEGES ON DATABASE metabase_app TO $POSTGRES_USER;
EOSQL

echo "✅ BASE DE DATOS metabase_app CREADA"

# Ejecuta el comando pg_restore
# -U: Usuario de PostgreSQL (obtenido de las variables de entorno)
# -d: Nombre de la base de datos (obtenido de las variables de entorno)
# -v: Modo "verbose" para ver más detalles durante la restauración
# La última parte es la ruta AL ARCHIVO DENTRO DEL CONTENEDOR
pg_restore -U "$POSTGRES_USER" -d "$POSTGRES_DB" -v "/backups/microges.backup"

echo "✅ BASE DE DATOS RESTAURADA CON ÉXITO"
