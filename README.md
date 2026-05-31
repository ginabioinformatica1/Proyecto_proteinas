# Pipeline de Búsqueda con HMMER

Este repositorio contiene un pipeline automatizado para descargar secuencias de proteínas desde UniProt, construir perfiles de Modelos Ocultos de Markov (HMM) y realizar búsquedas de homólogos utilizando la suite HMMER.

## Estructura del Proyecto
- codigo/: Contiene los scripts de R y Bash que ejecutan las herramientas.
- data/: Almacena las secuencias FASTA crudas y los perfiles HMM generados.
- resultados/: Contiene los reportes y tablas de salida de las búsquedas.

## Requerimientos
- R (versión 4.0 o superior)
- HMMER (hmmbuild, hmmsearch)

# PROCESO
# 1. Descarga de familias Pfam
# Ejecutar la siguiente linea en la terminal de Ubuntu:
wget https://ftp.ebi.ac.uk/pub/databases/Pfam/current_release/Pfam-A.hmm.gz

# 2. Crear carpeta de Pfam:
mkdir bio_db && cd bio_db

# 3. Descarga de modelos de archivos oclutos de Markov:
wget https://ftp.ebi.ac.uk/pub/databases/Pfam/current_release/Pfam-A.hmm.gz

# 4. Descomprimir archivo:
gunzip Pfam-A.hmm.gz

# Extraer solo las familias de interés a un archivo nuevo
hmmfetch -f bio_db/Pfam-A.hmm familias_interes.txt > bio_db/Pfam_reducido.hmm

# Indexar la nueva mini base de datos
hmmpress bio_db/Pfam_reducido.hmm

# Definir rutas de archivos con codigo de carpeta "busqueda_hmmer.sh"



