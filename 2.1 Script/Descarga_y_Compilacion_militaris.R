#Equipo 3

# Filogeografía de Ara militaris (Guacamaya Verde)


# DESCARGA DE SECUENCIAS GENBANK de Ara militaris

# 1. Instalar y cargar rentrez si no está instalado
if (!requireNamespace("rentrez", quietly = TRUE)) {
  install.packages("rentrez")
}
library(rentrez)  #puedes buscar y descargar secuencias de ADN directamente desde GenBank usando los números de acceso

# 2. Crear carpeta para guardar los archivos
dir.create("fasta_files_militaris", showWarnings = FALSE)

# 3. Generar IDs del rango KT957209 a KT957275
ids <- sprintf("KT957%03d", 209:275)

# 4. Descargar y guardar cada archivo FASTA
for (id in ids) {
  fasta <- entrez_fetch(db = "nuccore", id = id, rettype = "fasta", retmode = "text")
  writeLines(fasta, paste0("fasta_files_militaris/", id, ".fasta"))
}


# COMPILACION DE SECUENCIAS

# 5. Listar todos los archivos FASTA en la carpeta
archivos <- list.files("fasta_files_militaris", pattern = "\\.fasta$", full.names = TRUE)

# 6. Leer y combinar el contenido de todos los archivos
secuencias <- unlist(lapply(archivos, readLines))

# 7. Guardar en un único archivo FASTA
writeLines(secuencias, "secuencias_compiladas_militaris.fasta")


# 8. Limpieza de encabezados

library(Biostrings)

# 8.1 Leer archivo FASTA
fasta <- readDNAStringSet("secuencias_compiladas_militaris.fasta")

# 8.2 Función para limpiar encabezado
limpiar_encabezado <- function(nombre_original) {
  # Extraer código GenBank (ej. AY669860)
  codigo <- sub("\\..*", "", nombre_original)
  
  # Extraer nombre de especie
  especie <- sub(".*? ([A-Z][a-z]+ [a-z]+).*", "\\1", nombre_original)
  
  # Combinar en formato deseado
  nuevo <- paste0(especie, "_", codigo)
  return(nuevo)
}

# 8.3 Aplicar limpieza a todos los nombres
names(fasta) <- sapply(names(fasta), limpiar_encabezado)

# 8.4 Guardar archivo limpio
writeXStringSet(fasta, "secuencias_limpias_militaris.fasta")


#########  ALINEAMIENTO EN UBUNTU   #############

