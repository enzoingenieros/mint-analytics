#!/bin/bash
set -e

# Ejecuta el comando pg_restore
# -U: Usuario de PostgreSQL (obtenido de las variables de entorno)
# -d: Nombre de la base de datos (obtenido de las variables de entorno)
# -v: Modo "verbose" para ver más detalles durante la restauración
# La última parte es la ruta AL ARCHIVO DENTRO DEL CONTENEDOR
pg_restore -U "$POSTGRES_USER" -d "$POSTGRES_DB" -v "/backups/microges.backup"

echo "✅ BASE DE DATOS RESTAURADA CON ÉXITO"
