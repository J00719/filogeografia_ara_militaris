
# Limpiar ambiente
rm(list=ls())

# Librerías necesarias
library(dismo)
library(raster)
library(geodata)
library(terra)

# 1. Cargar datos de ocurrencia (tu CSV de GBIF)
# Asegúrate que tenga columnas "lon" y "lat"
occ <- read.csv("Ara_militaris_gbif_step1.csv", header=TRUE)

# 2. Descargar variables bioclimáticas de WorldClim (resolución 10 minutos)
env_spat <- worldclim_global(var="bio", res=10, path="wc10")

# 3. Recortar al área de interés (ejemplo: México)
mex_extent <- ext(-120, -85, 10, 35)
env_spat_mex <- crop(env_spat, mex_extent)

# 4. Convertir a RasterStack (para usar con dismo)
env_mex <- raster::stack(env_spat_mex)

# 5. Entrenar modelo con Bioclim
bc <- bioclim(env_mex, occ[,c("lon","lat")])

# 6. Predecir distribución
pred <- predict(env_mex, bc)

# 7. Graficar resultados
plot(pred, main="Modelo de nicho Ara militaris (Bioclim)")
points(occ[,c("lon","lat")], pch=20, col="red")

# 8. Guardar el mapa
writeRaster(pred, "Ara_militaris_bioclim.asc", overwrite=TRUE)
