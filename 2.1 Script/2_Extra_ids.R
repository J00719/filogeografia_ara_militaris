#Equipo 3

# Filogeografía de Ara militaris (Guacamaya Verde)


# DESCARGA DE SECUENCIAS GENBANK DE OTRAS ESPECIES

# Instalar y cargar rentrez si no está instalado
if (!requireNamespace("rentrez", quietly = TRUE)) {
  install.packages("rentrez")
}
library(rentrez)

# Crear carpeta para guardar los archivos
dir.create("fasta_files", showWarnings = FALSE)

# Solo los extra_ids proporcionados
extra_ids <- c(
  "AY669860", "MK642197", "MW999346", "MT275990", "AY669858",
  "KM372121", "AY669859", "KM372183", "MK642170", "KM372184",
  "KM372268", "KM372185", "DQ150995"
)

# Descargar y guardar cada archivo FASTA (solo extra_ids)
for (id in extra_ids) {
  fasta <- entrez_fetch(db = "nuccore", id = id, rettype = "fasta", retmode = "text")
  writeLines(fasta, paste0("fasta_files/", id, ".fasta"))
}

# COMPILACION DE TODAS LAS SECUENCIAS

# 5. Listar todos los archivos FASTA en la carpeta
archivos <- list.files("fasta_files", pattern = "\\.fasta$", full.names = TRUE)

# 6. Leer y combinar el contenido de todos los archivos
secuencias <- unlist(lapply(archivos, readLines))

# 7. Guardar en un único archivo FASTA
writeLines(secuencias, "secuencias_compiladas_all.fasta")

# 8. Limpieza de encabezados

library(Biostrings)

# 8.1 Leer archivo FASTA
fasta <- readDNAStringSet("secuencias_compiladas_all.fasta")

# 8.2 Función para limpiar encabezado
limpiar_encabezado <- function(nombre_original) {
  # Extraer código GenBank (ej. AY669860)
  codigo <- sub("\\..*", "", nombre_original)
  
  # Extraer nombre de especie y reemplazar espacios por _
  especie <- sub(".*? ([A-Z][a-z]+ [a-z]+).*", "\\1", nombre_original)
  especie <- gsub(" ", "_", especie)  # Reemplazar espacios por _
  
  # Combinar en formato deseado
  nuevo <- paste0(especie, "_", codigo)
  return(nuevo)
}

# 8.3 Aplicar limpieza a todos los nombres
names(fasta) <- sapply(names(fasta), limpiar_encabezado)

# 8.4 Guardar archivo limpio
writeXStringSet(fasta, "secuencias_limpias_all.fasta")

######### ALINEAMIENTO EN UBUNTU   #############
