#!/bin/bash

# Definir rutas de archivos
FASTA_INPUT="data/proteinas_estudio.fasta"
HMM_DB="bio_db/Pfam_reducido.hmm"
OUTPUT_TAB="resultados/resultados_pfam.tab"
OUTPUT_TXT="resultados/resultados_detallados.txt"

echo "=== Iniciando búsqueda de dominios con HMMER ==="

# Ejecutar hmmscan optimizado para formato de tabla
hmmscan --tblout $OUTPUT_TAB $HMM_DB $FASTA_INPUT > $OUTPUT_TXT

echo "=== Proceso completado. Resultados guardados en la carpeta 'resultados/' ==="