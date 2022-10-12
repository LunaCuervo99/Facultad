#!/bin/bash 

#Realice un script que implemente a través de la utilización de funciones las operaciones
#básicas sobre arreglos:
#inicializar: Crea un arreglo llamado array vacío
#agregar_elem <parametro1>: Agrega al final del arreglo el parámetro recibido
#eliminar_elem <parametro1>: Elimina del arreglo el elemento que se encuentra en la
#posición recibida como parámetro. Debe validar que se reciba una posición válida
#longitud: Imprime la longitud del arreglo en pantalla
#imprimir: Imprime todos los elementos del arreglo en pantalla
#inicializar_Con_Valores <parametro1><parametro2>: Crea un arreglo con longitud
#<parametro1>y en todas las posiciones asigna el valor <parametro2>

function inicializar {
  array=()
}

function agregar_elem {
  if [ ${#array[*]} -eq 0] 
  then
    array[0]=$1
  else
    array[${#array[*]}]=$1
  fi
}

function eliminar_elem {
  if ( $1 -gt $(expr ${#array[*]} -1);
  then
    echo "No es una posicion válida "
  else
    unset array[$1]
  fi
}

function print {
  echo "${array[*]}"
}

function longitud {
  echo "La longitud del arreglo es: ${#array[*]}"
}

function inicializar_Con_Valores {
  arreglo=()
  for (i=0;i<$1;i++)
  do
    arreglo[i]=$2
  done
}
