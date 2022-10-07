#!/bin/bash

#Renombrando Archivos: haga un script que renombre solo archivos de un directorio pasado
#como parametro agregandole una CADENA, contemplando las opciones:
#“-a CADENA”: renombra el fichero concatenando CADENA al final del nombre del archivo
#“-b CADENA”: renombra el fichero concantenado CADENA al principio del nombre del archivo
#Ejemplo:
#Si tengo los siguientes archivos: /tmp/a /tmp/b
#Al ejecutar: ./renombra /tmp/ -a EJ
#Obtendré como resultado: /tmp/aEJ /tmp/bEJ
#Y si ejecuto: ./renombra /tmp/ -b EJ
#El resultado será: /tmp/EJa /tmp/EJb

if [ $# -eq 3]; 
then
 if [ -e $1 ]; #$1 seria el directorio pasado por parametro
 then 
   #$2 seria la opcion -a o -b
   case $2 in 
    "-a" )
      for i in $(ls $1)
      do
        #$3 es la cadena
        mv $1/$i $1/$i$3
      done
    ;;
    "-b" )
      for i in $(ls $1)
      do
        mv $1/$i $1/$3$1
      done
    ;;
    esac
    exit 0
  else
    echo "No existe el directorio"
    exit 2
  fi
else
  echo "No se pasaron los parametros suficientes"
  exit 1
fi
