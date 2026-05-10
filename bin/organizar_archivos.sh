#!/bin/bash

# Directorio donde están los archivos a organizar
DIRECTORIO_ORIGEN="$1"

# Verificar si el directorio de origen está especificado
if [ -z "$DIRECTORIO_ORIGEN" ]; then
  echo "Por favor, especifica el directorio de origen."
  exit 1
fi

# Verificar si el directorio de origen existe
if [ ! -d "$DIRECTORIO_ORIGEN" ]; then
  echo "El directorio '$DIRECTORIO_ORIGEN' no existe."
  exit 1
fi

# Iterar sobre todos los archivos en el directorio de origen
for archivo in "$DIRECTORIO_ORIGEN"/*; do
  # Verificar si es un archivo (y no un directorio)
  if [ -f "$archivo" ]; then
    # Obtener el mes y el año de la última modificación del archivo
    mes_ano=$(date -r "$archivo" +"%Y-%m")

    # Crear el directorio correspondiente si no existe
    if [ ! -d "$DIRECTORIO_ORIGEN/$mes_ano" ]; then
      mkdir "$DIRECTORIO_ORIGEN/$mes_ano"
    fi

    # Mover el archivo al directorio correspondiente
    mv "$archivo" "$DIRECTORIO_ORIGEN/$mes_ano/"
  fi
done

echo "Archivos organizados por mes."

