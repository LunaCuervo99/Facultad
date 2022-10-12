#!/bin/bash

#Realice un script que reciba como parámetro el nombre de un directorio. Deberá validar que
#el mismo exista y de no existir causar la terminación del script con código de error 4. Si el
#directorio existe deberá contar por separado la cantidad de archivos que en él se encuentran
#para los cuales el usuario que ejecuta el script tiene permiso de lectura y escritura, e informar
#dichos valores en pantalla. En caso de encontrar subdirectorios, no deberán procesarse, y
#tampoco deberán ser tenidos en cuenta para la suma a informar.

if [ $# -lt 1 ];
then
  echo "No se enviaron parametros"
  exit 1
else
  if [ -e $1 ]
  then
    cant=0
    for i in $(ls -l $1)
    do
      if ( -f $1/$i )
      then
        if ( -w $1/$i ) && ( -r $1/$i )
          let cant++
        fi
      fi
    done
    echo "La cantidad de archivos con permiso de lectura y escritura es: $cant "
    exit 0
  else 
    echo "No existe el directorio $1"
    exit 4
  fi
fi
