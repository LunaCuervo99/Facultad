#!/bin/bash

#Crear un script que reciba como parámetro el nombre de un archivo e informe si el
#mismo existe o no, y en caso afirmativo indique si es un directorio o un archivo. En
#caso de que no exista el archivo/directorio cree un directorio con el nombre recibido
#como parámetro.

if [[ $# -lt 1 ]]; then
	echo "No se pasaron parametros"
	exit 1
fi

if [[ -e $1 ]]
then
   if [[ -d $1 ]]; then
      echo "$1 es un directorio"
   elif [[ -f $1 ]]; then
   	echo "$1 es un archivo"
   fi
else 
   echo "$1 no existe"
   mkdir $1
fi
exit 0
