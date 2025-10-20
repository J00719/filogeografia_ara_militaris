# Filogeografía de Ara militaris (Guacamaya Verde)
Repositorio para el análisis filogeográfico de la guacamaya verde (Ara militaris)

---

# 🧬 Bioinformática para el análisis filogeográfico de Ara militaris

Este repositorio documenta el flujo bioinformático utilizado para analizar la diversidad genética y reconstruir las relaciones filogenéticas de la guacamaya verde (Ara militaris) a partir de secuencias mitocondriales (Cyt-b).

## 🧪 Flujo de trabajo bioinformático

### 1. Alineación de secuencias

- **Software**:  
  - `SEQUENCHER 4.2` para ensamblar secuencias forward/reverse.  
  - `MUSCLE 5.0` para alineación múltiple.  
  - `MEGA 6.0.6` para traducción y verificación de codones de parada.

- **Entrada**: Secuencias mitocondriales Cyt-b (formato FASTA).  
- **Salida**: Alineación curada sin codones de parada.

---

### 2. Análisis de diversidad genética

- **Software**:  
  - `DnaSP 5.10.01` para estimar:  
    - Diversidad de haplotipos (h)  
    - Diversidad nucleotídica (π)

- **Entrada**: Alineación en formato FASTA o NEXUS.  
- **Salida**: Estadísticos de diversidad por población.

---

### 3. Estructura poblacional

- **Software**:  
  - `ARLEQUIN 3.11` para:  
    - AMOVA jerárquico  
    - FST por pares  
  - `SPADS 1.0` para análisis espacial SAMOVA (estimación de FCT)

- **Entrada**: Archivos `.arp` generados desde alineaciones.  
- **Salida**: Matrices de varianza y diferenciación genética.

---

### 4. Reconstrucción filogenética

- **Software**:  
  - `PARTITIONFINDER` para seleccionar modelos evolutivos y esquemas de codones.  
  - `MrBayes 3.2` para inferencia bayesiana (BI).  
  - `RAxML 7.2.8` para máxima verosimilitud (ML).  
  - `Tracer` para verificar convergencia y ESS.

- **Entrada**: Alineación en formato NEXUS o PHYLIP.  
- **Salida**: Árboles filogenéticos con soporte estadístico.

---

## 📁 Estructura sugerida del repositorio

```
├── data/
│   ├── raw_sequences/
│   ├── aligned_sequences/
│   └── metadata/
├── scripts/
│   ├── alignment/
│   ├── diversity/
│   ├── phylogeny/
│   └── structure/
├── results/
│   ├── trees/
│   ├── diversity_stats/
│   └── amova_fst/
├── README.md
```

---

¿Quieres que te ayude a crear los scripts o los archivos de configuración para MrBayes, RAxML o PartitionFinder?
