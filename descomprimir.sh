#!/bin/bash

# Ruta de la carpeta que contiene los archivos RAR
carpeta="Nombre carpeta"

# Contraseña común para todos los archivos RAR
contrasena_comun="contraseña"

# Verificar si la carpeta existe
if [ ! -d "$carpeta" ]; then
  echo "La carpeta no existe: $carpeta"
  exit 1
fi

# Cambiar al directorio de la carpeta
cd "$carpeta" || exit 1

# Recorrer todos los archivos RAR en la carpeta
for archivo_rar in *.rar; do
  # Verificar si hay archivos RAR
  if [ -e "$archivo_rar" ]; then
    # Descomprimir el archivo RAR con la contraseña
    unrar x -p"$contrasena_comun" "$archivo_rar"
  else
    echo "No hay archivos RAR en la carpeta."
  fi
done

echo "Descompresión completada."
