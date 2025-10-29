# ALINEAMIENTO DE SECUENCIAS DE A. militaris EN UBUNTU CON MUSCLE V5.2

## PASO 1 Navegar al directorio de trabajo
Nos dirigimos al directorio en donde estabamos trabajando en R 

```bash

cd * #en Ubuntu los guiones deben estar de la siguiente forma: /
```


## Paso 2: Verificar si MUSCLE está instalado
```bash
muscle
``` 

Si está instalado correctamente, deberías ver un mensaje similar a: 

``` 
muscle 5.2.linux64 [-]  16.0Gb RAM, 22 cores
Built Nov  5 2022 18:45:38
(C) Copyright 2004-2021 Robert C. Edgar.
https://drive5.com
``` 
## Paso 3: Instalar MUSCLE (si no está instalado)

```bash
sudo apt update
sudo apt install muscle
```

## Paso 4: Confirmar instalación

```bash
muscle -versión
```
Salida esperada:
```
muscle 5.2.linux64 [-]
Built Nov  5 2022 18:45:38
```

## Paso 5: Crear el script de alineamiento

```bash

nano alinear_muscle_militaris.sh
```

En la ventana que se abre, pega el siguiente código: 


```bash

#!/bin/bash

entrada="secuencias_limpias_militaris.fasta"
salida="alineamiento_muscle_militaris.fasta"

# Verificar archivo de entrada
[ -f "$entrada" ] || { echo "❌ No se encontró el archivo: $entrada"; exit 1; }

# Ejecutar alineamiento
muscle -align "$entrada" -output "$salida" && \
echo "✅ Alineamiento completado: $salida"
```

Para salir del editor: presiona `Ctrl + X`, luego `Y` para guardar, y `Enter` para confirmar.



## Paso 6: Dar permisos de ejecución

```bash
chmod +x alinear_muscle.sh
```

## Paso 7: Ejecutar el script

```bash
./alinear_muscle_militaris.sh
```





