
# Reconstrucción Filogenética  
Para explorar las relaciones evolutivas dentro del género Ara, ampliamos nuestro conjunto de datos genéticos incorporando secuencias del gen mitocondrial Cyt-b de especies cercanas disponibles en GenBank. Estas secuencias permitieron calibrar el tiempo de divergencia y evaluar el impacto 
del uso de múltiples grupos externos en las inferencias filogenéticas.

---
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

#3 ejecutar MrBayes
./src/mb

# ya debe aparecer el prompt de MrBayes 
MrBayes v3.2.x
Type 'help' for available commands.
MrBayes >

---
