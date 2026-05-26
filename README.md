# Pipeline de Búsqueda con HMMER

Este repositorio contiene un pipeline automatizado para descargar secuencias de proteínas desde UniProt, construir perfiles de Modelos Ocultos de Markov (HMM) y realizar búsquedas de homólogos utilizando la suite HMMER.

## Estructura del Proyecto
- codigo/: Contiene los scripts de R y Bash que ejecutan las herramientas.
- data/: Almacena las secuencias FASTA crudas y los perfiles HMM generados.
- resultados/: Contiene los reportes y tablas de salida de las búsquedas.

## Requerimientos
- R (versión 4.0 o superior)
- HMMER (hmmbuild, hmmsearch)

