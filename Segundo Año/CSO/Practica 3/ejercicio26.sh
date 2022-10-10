#!/bin/bash

#Escriba un script que reciba una cantidad desconocida de parámetros al momento de su invocación 
#(debe validar que al menos se reciba uno). Cada parámetro representa la ruta absoluta
#de un archivo o directorio en el sistema. El script deberá iterar por todos los parámetros recibidos,
#y solo para aquellos parámetros que se encuentren en posiciones impares (el primero, el tercero, el quinto, etc.),
#verificar si el archivo o directorio existen en el sistema, imprimiendo en pantalla que tipo
#de objeto es (archivo o directorio). Además, deberá informar la cantidad de archivos o
#directorios inexistentes en el sistema.

if [ $# -lt 1 ];
then
  echo "No se pasaron parametros"
  exit 1
else
  inexistentes=0
  indice=1
  for i in $*
  do
    if [ $(expr $indice % 2) -eq 0 ];
    then
      echo "es par"  
      let indice++
    else
      archivo=`$("$i")`
      if [ -e $archivo ];
      then
        if [ -f $archivo ];
          echo "Es un archivo (file)"
        elif [ -d $archivo ];
        then
          echo "Es un directorio"
        fi
      else
        echo "No existe el archivo $archivo "
        let inexistentes++
      fi
      let indice++
    fi
  done  
  echo "Cantidad de archivos inexistentes: $inexistentes "
  exit 0
