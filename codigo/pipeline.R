# 1. Definición de rutas y archivos de interés
base_pfam     <- "/home/ginamaria/bio_db/Pfam-A.hmm"
lista_txt     <- "/home/ginamaria/bio_db/familias_interes.txt"
pfam_reducido <- "/home/ginamaria/bio_db/Pfam_reducido.hmm"
fasta_input   <- "data/secuencias_uniprot.fasta"
output_hmm    <- "resultados/resultados_dominios.txt"

# Asegurar que la carpeta de resultados exista
if (!dir.exists("resultados")) {
  dir.create("resultados")
}

# 2. Guardar la lista de las 38 familias del Anexo 1 en un archivo de texto
familias <- c(
  "Protein_kinase", "Pkinase_Tyr", "Ras", "SH2", "SH3_1", "zf-C2H2", 
  "Homeobox", "HTH_1", "bZIP_1", "Myb_DNA-binding", "RRM_1", "DEAD", 
  "KH_1", "dsrm", "ABC_tran", "MFS_1", "Ion_trans", "HlyD", 
  "Aminotran_1_2", "Aldedh", "TIM", "NAD_binding_1", "GST_C_family", 
  "WD40", "Ank", "TPR_1", "LRR_1", "HSP70", "HSP20", "DnaJ", 
  "Response_reg", "HisKA", "Peptidase_M16", "Sigma70_r2", "Immunoglobulin", 
  "EGF", "Cadherin", "Fibronectin"
)

writeLines(familias, con = lista_txt)
message("--> Lista de familias guardada en: ", lista_txt)


# 3. EXTRAER FAMILIAS 
message("--> Extrayendo familias seleccionadas desde la base de datos global...")
cmd_fetch <- paste("hmmfetch -f", base_pfam, lista_txt, ">", pfam_reducido)
system(cmd_fetch)


# 4. INDEXAR LA NUEVA BASE DE DATOS REDUCIDA
message("--> Indexando el archivo HMM reducido...")
cmd_press <- paste("hmmpress -f", pfam_reducido)
system(cmd_press)


# 5. EJECUTAR LA BÚSQUEDA (hmmscan)
message("--> Iniciando escaneo de secuencias con hmmscan...")
cmd_scan <- paste("hmmscan --domtblout", output_hmm, pfam_reducido, fasta_input)
system(cmd_scan)
message("--> ¡Búsqueda completada! Resultados guardados en: ", output_hmm)


# ==============================================================================
# 6. LECTURA Y VISUALIZACIÓN DE RESULTADOS
# ==============================================================================
message("--> Procesando matriz de resultados...")

# Leer el reporte omitiendo las líneas de comentarios (#) de HMMER
resultados <- read.table(output_hmm, comment.char = "#", fill = TRUE, stringsAsFactors = FALSE)

# Renombrar las columnas clave del formato de dominio de HMMER
colnames(resultados)[1:4] <- c("Familia_Pfam", "Acceso_Pfam", "Proteina_Query", "Acceso_Proteina")

# Filtrar columnas esenciales para la asignación limpia
mapeo_final <- unique(resultados[, c("Proteina_Query", "Familia_Pfam")])

# Mostrar el resultado final en la consola de R
print(mapeo_final)