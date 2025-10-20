

# DESCARGA DE SECUENCIAS GENBANK


# Instalar paquetes si no están disponibles

install.packages("rentrez") 
install.packages("seqinr") 
install.packages("BiocManager")

#Cargar librerias

library(rentrez) #puedes buscar y descargar secuencias de ADN directamente desde GenBank usando los números de acceso
library(seqinr)
library(msa)
library(Biostrings)
library(ape)

#
# 1 Generar lista de IDs (KT957209 a KT957275)
inicio <- 209
fin <- 275
prefix <- "KT957"
ids <- paste0(prefix, sprintf("%03d", inicio:fin))

# Mostrar los IDs generados
print(ids)

# 2 Crear carpeta de salida
dir.create("fasta_genbank", showWarnings = FALSE)
setwd("fasta_genbank")

# 3⃣ Descargar secuencias en formato FASTA
for (id in ids) {
  cat("Descargando:", id, "...\n")
  try({
    fasta_seq <- entrez_fetch(db="nucleotide", id=id, rettype="fasta", retmode="text")
    write(fasta_seq, file=paste0(id, ".fasta"))
  }, silent=TRUE)
}


# Combinar todos los archivos FASTA en uno solo

# 1. Leer todos los FASTA en la carpeta ####

carpeta_fasta <- "C:/MisArchivos/UNAM/UNAM/7mo/Analisis Genimicos/presentacion/Script/Descarga FASTA/fasta_genbank"

archivos <- list.files(carpeta_fasta, pattern = "\\.fasta$", full.names = TRUE)

# Leer cada FASTA como DNAStringSet
lista_fasta <- lapply(archivos, readDNAStringSet)

# Combinar todos en un único DNAStringSet
fasta_combinado <- do.call(c, lista_fasta)

archivo_salida <- file.path(carpeta_fasta, "alineamiento_muscle.fasta")
writeXStringSet(alineamiento_dna, filepath = archivo_salida)
################################################################

# Convertir el alineamiento a DNAStringSet
alineamiento_dna <- as(alineamiento, "DNAStringSet")

# Definir la ruta de salida
archivo_salida <- file.path(carpeta_fasta, "alineamiento_muscle.fasta")

# Guardar el alineamiento en formato FASTA
writeXStringSet(alineamiento_dna, filepath = archivo_salida)

