
# 🦜 Filogeografía de *Ara militaris* (Guacamaya Verde)

Este repositorio contiene el flujo de trabajo bioinformático y los análisis de diversidad genética y filogeografía de la guacamaya verde (*Ara militaris*), una especie en riesgo cuya distribución se extiende desde México hasta Sudamérica.  

El objetivo es **evaluar la diversidad genética, estructura poblacional y patrones históricos de distribución** de la especie, integrando datos moleculares y de modelado de nicho ecológico.

---

## 📂 Estructura del repositorio

```
├── data/                 
│   ├── raw_sequences/       # Secuencias crudas (FASTA, GBIF, GenBank)
│   ├── aligned_sequences/   # Alineaciones curadas
│   ├── metadata/            # Información de muestras y poblaciones
│   └── occurrences/         # Datos de ocurrencia (GBIF, CSV)
│
├── scripts/                
│   ├── alignment/           # Alineación de secuencias (MUSCLE, MEGA)
│   ├── diversity/           # Diversidad genética (DnaSP, Arlequin)
│   ├── phylogeny/           # Reconstrucción filogenética (MrBayes, RAxML)
│   ├── structure/           # Estructura poblacional (AMOVA, SAMOVA)
│   └── niche_models/        # Modelos de nicho (MaxEnt, Bioclim, kuenm)
│
├── results/                
│   ├── trees/               # Árboles filogenéticos
│   ├── diversity_stats/     # Estadísticos de diversidad
│   ├── amova_fst/           # Resultados de AMOVA y FST
│   ├── niche_maps/          # Mapas de distribución potencial
│   └── tables/              # Tablas de resultados
│
└── README.md
```

---

## ⚙️ Requisitos

### Software principal
- **R** (≥ 4.0) con paquetes: `dismo`, `raster`, `terra`, `geodata`, `kuenm`
- **MUSCLE** – alineación múltiple
- **MEGA** – verificación de codones
- **DnaSP** – diversidad genética
- **Arlequin** – AMOVA y FST
- **SPADS** – SAMOVA
- **PartitionFinder** – selección de modelos evolutivos
- **MrBayes** – inferencia bayesiana
- **RAxML** – máxima verosimilitud
- **Tracer** – verificación de convergencia

### Instalación de paquetes en R
```r
install.packages(c("dismo", "raster", "terra", "geodata"))
# kuenm desde GitHub
remotes::install_github("marlonecobos/kuenm")
```

---

## 🚀 Flujo de trabajo

1. **Procesamiento de secuencias**  
   - Ensamblaje y alineación (MUSCLE, MEGA).  
   - Verificación de codones.  

2. **Diversidad genética**  
   - Diversidad de haplotipos (h) y nucleotídica (π).  
   - Estadísticos de neutralidad.  

3. **Estructura poblacional**  
   - AMOVA jerárquico.  
   - FST por pares.  
   - SAMOVA para estructura espacial.  

4. **Filogenia**  
   - Inferencia bayesiana (MrBayes).  
   - Máxima verosimilitud (RAxML).  
   - Selección de modelos (PartitionFinder).  

5. **Modelado de nicho ecológico**  
   - Datos de ocurrencia (GBIF).  
   - Variables bioclimáticas (WorldClim).  
   - Modelos con MaxEnt y Bioclim.  
   - Proyecciones al Holoceno, LGM y escenarios futuros.  

---

## 📊 Resultados esperados

- Árboles filogenéticos con soporte estadístico.  
- Estadísticos de diversidad genética por población.  
- Matrices de diferenciación genética (FST, AMOVA).  
- Mapas de distribución potencial (presente, pasado, futuro).  
- Identificación de refugios históricos y áreas prioritarias de conservación.  

---



---

## ✨ Autores

**Juan Pablo Ramírez Mendoza, chiara Ordoñez,Osvaldo**  

