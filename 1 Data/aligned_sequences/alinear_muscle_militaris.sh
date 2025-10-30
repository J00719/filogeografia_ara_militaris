#!/bin/bash

entrada="secuencias_limpias_militaris.fasta"
salida="alineamiento_muscle_militaris.fasta"

# Verificar archivo de entrada
[ -f "$entrada" ] || { echo "❌ No se encontró el archivo: $entrada"; exit 1; }

# Ejecutar alineamiento
muscle -align "$entrada" -output "$salida" && \
echo "✅ Alineamiento completado: $salida"
