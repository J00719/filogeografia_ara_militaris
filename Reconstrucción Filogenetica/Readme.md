
# Reconstrucción Filogenética  
Para explorar las relaciones evolutivas dentro del género Ara, ampliamos nuestro conjunto de datos genéticos incorporando secuencias del gen mitocondrial Cyt-b de especies cercanas disponibles en GenBank. Estas secuencias permitieron calibrar el tiempo de divergencia y evaluar el impacto 
del uso de múltiples grupos externos en las inferencias filogenéticas.

---
##Descargar MrBayes

Para comenzar descargaremos MrBayes, puedes hacerlo desde el siguiente archivo en GitHub que contiene las instrucciones oficiales para compilar e instalar MrBayes desde el código fuente: https://github.com/NBISweden/MrBayes/blob/develop/INSTALL.

A continuación se presentan las lineas de comando
```python
#Requisitos previos 

xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#si sale “xcode-select: error: command line tools are already installed, use "Software Update" to install updates”
entonces ya teniamoss instaladas las herramientas de línea de comandos de Xcode

#Esto instalará las herramientas necesarias para configurar y compilar el proyecto.
brew install autoconf automake libtool

#Clona el repositorio de MrBayes

git clone https://github.com/NBISweden/MrBayes.git
cd MrBayes

./autogen.sh
./configure
make

#3 corroborar descarga
./src/mb

# ya debe aparecer el prompt de MrBayes 
MrBayes v3.2.x
Type 'help' for available commands.
MrBayes >
```

---
##Secuencias

Para hacer nuestro análisis necesitamos un archivo NEXUS (.nex) con nuestras seciencias alineadas incluyendo al grupo externo.

En nuestro artículo de referencia proporcionan 67 secuencias en GenBank, con los IDs del rango KT957209 a KT957275 y unas secuencias de referencia de Cyt-b de otras especies del género Ara (A. macao, A. chloropterus, A. glaucogularis, A. ararauna y A. severus) junto con Primolius auricollis, que eran accesibles en GenBank.

Si descargamos desde GenBank, se bajan primeramente en formato .fasta, se alinean en MEGA o un programa similar y al guardarlo es que se hace la conversion a .nex
---
## Ejecutar análisis

Antes de utilizar MrBayes debemos ubicar nuesrto archivo .nex en la misma carpeta que el programa, posteriormente volvemos a ingresar a MrBayes 

```python
#en caso de seguir dentro del progrma utilizamos el comando quit para salir

#mover nuestro archivo
cp "/Users/chiara/Descargas/Secuencias Ara militaris/mili-macao.nexus" /Users/chiara/MrBayes/

#para volver a entrar a MrBayes
./src/mb

#ejecutar
execute mrbayes//Users/chiara/Descargas/Secuencias\ Ara\ militaris/mili-macao.nexus

#Mientras eperamos a que termine el análisis se puede ver mensajes como Running MCMC... y el progreso de generaciones.
Cuando termine, MrBayes generará varios archivos:
*.p → parámetros del MCMC
*.t → árboles muestreados
*.con.tre → árbol de consenso
```


