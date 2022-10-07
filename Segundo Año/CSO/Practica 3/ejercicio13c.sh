#!/bin/bash

#Crear un script que reciba como parámetro el nombre de un archivo e informe si el
#mismo existe o no, y en caso afirmativo indique si es un directorio o un archivo. En
#caso de que no exista el archivo/directorio cree un directorio con el nombre recibido
#como parámetro.

if [[ $# -eq 1 ]]; then
	echo "No se pasaron parametros"
	exit 1
fi

if [ -d $1 ]; then
    echo "$1 es un directorio"
elsif [ -f $1 ]; then
    echo "$1 es un archivo"
else 
    echo "$1 No existe"
    mkdir $1
fi