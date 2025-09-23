# Directorio de Backups

Este directorio contiene los backups de la base de datos PostgreSQL.

## Instrucciones

Coloca aquí el archivo `microges.backup` con el backup de la base de datos.

```bash
cp /ruta/a/tu/microges.backup ./microges.backup
```

El archivo `microges.backup` será restaurado automáticamente cuando se levante el contenedor de Docker por primera vez.

**Nota:** El archivo `microges.backup` está incluido en `.gitignore` para evitar subir datos sensibles al repositorio.