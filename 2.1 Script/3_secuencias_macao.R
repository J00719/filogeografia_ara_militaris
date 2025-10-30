#Equipo 3

# Filogeografía de Ara militaris (Guacamaya Verde)


# COMPILACIÓN de Ara macao y Ara militaris

library(Biostrings)

# Listar todos los archivos FASTA en la carpeta
archivos <- list.files("fasta_files", pattern = "\\.fasta$", full.names = TRUE)

# Función para filtrar secuencias por especie
filtrar_secuencias_por_especie <- function(archivos, especies_deseadas) {
  secuencias_filtradas <- character()
  
  for (archivo in archivos) {
    lineas <- readLines(archivo)
    # Verificar si el encabezado contiene alguna de las especies deseadas
    encabezado <- lineas[1]
    
    for (especie in especies_deseadas) {
      if (grepl(especie, encabezado, ignore.case = TRUE)) {
        secuencias_filtradas <- c(secuencias_filtradas, lineas)
        break
      }
    }
  }
  
  return(secuencias_filtradas)
}

# Especies que queremos incluir
especies_deseadas <- c("Ara militaris", "Ara macao")

# Filtrar secuencias
secuencias_filtradas <- filtrar_secuencias_por_especie(archivos, especies_deseadas)

# Guardar secuencias filtradas
writeLines(secuencias_filtradas, "secuencias_filtradas.fasta")

# LIMPIEZA DE ENCABEZADOS

# Leer archivo FASTA filtrado
fasta <- readDNAStringSet("secuencias_filtradas.fasta")

# Función para limpiar encabezado
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

# Aplicar limpieza a todos los nombres
names(fasta) <- sapply(names(fasta), limpiar_encabezado)

# Guardar archivo limpio y filtrado
writeXStringSet(fasta, "secuencias_limpias_macao_militaris.fasta")


######### ALINEAMIENTO EN UBUNTU   #############


