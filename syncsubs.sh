#!/bin/bash

# Directorio donde se encuentran los archivos de video y subtítulos
DIRECTORIO="path de la carpeta"

# Cambiamos al directorio donde están los archivos
cd "$DIRECTORIO" || exit

# Iteramos sobre los archivos de video MP4 y MKV
for VIDEO in *.mkv *.mp4; do
    # Extraemos el nombre base del archivo de video
    NOMBRE_BASE=$(basename "$VIDEO" .mkv)
    NOMBRE_BASE=$(basename "$NOMBRE_BASE" .mp4)

    # Buscamos el subtítulo correspondiente al nombre base del video
    SUBTITULO=$(find . -type f -name "$NOMBRE_BASE".*.srt)

    if [ -f "$SUBTITULO" ]; then
        # Nombre del archivo de salida para el subtítulo sincronizado
        SALIDA="$NOMBRE_BASE"_synced.srt
        
        # Sincronizamos el subtítulo con el video usando alass
        alass "$VIDEO" "$SUBTITULO" "$SALIDA"
        
        if [ $? -eq 0 ]; then
            echo "Subtítulo sincronizado para $VIDEO"
            
            # Borramos el subtítulo desincronizado
            rm "$SUBTITULO"
            echo "Subtítulo desincronizado eliminado: $SUBTITULO"
            
            # Si el nombre del archivo de salida es diferente al original, lo renombramos
            if [ "$SALIDA" != "$SUBTITULO" ]; then
                mv "$SALIDA" "$SUBTITULO"
                echo "Subtítulo sincronizado renombrado: $SUBTITULO"
            fi
        else
            echo "Error al sincronizar el subtítulo para $VIDEO"
        fi
    else
        echo "No se encontró subtítulo para $VIDEO"
    fi
done

echo "Proceso completado"
