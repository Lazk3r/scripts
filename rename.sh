#!/bin/bash

# Ir al directorio donde están los archivos
cd /home/lazk3r/Videos/House.of.the.Dragon.S01.1080p.BRRip.AAC.AV1-NASH

# Iterar sobre todos los archivos en el directorio
for archivo in *; do
    # Verificar si el archivo es un archivo regular
    if [ -f "$archivo" ]; then
        # Obtener la extensión del archivo
        extension="${archivo##*.}"
        
        # Obtener el nombre del archivo sin la extensión
        nombre_sin_extension="${archivo%.*}"

        # Extraer la parte del nombre que deseas conservar
        nuevo_nombre=$(echo "$nombre_sin_extension" | grep -oE 'S[0-9]+E[0-9]+')

        # Crear el nuevo nombre del archivo
        nuevo_nombre="$nuevo_nombre.$extension"

        # Renombrar el archivo
        mv "$archivo" "$nuevo_nombre"

        echo "Archivo $archivo renombrado a $nuevo_nombre"
    fi
done
