#!/bin/bash

#Realice un script que agregue en un arreglo todos los nombres de los usuarios del sistema
#pertenecientes al grupo “users”. Adicionalmente el script puede recibir como parametro:
#“-b n”: Retorna el elemento de la posición n del arreglo si el mismo existe. Caso
#contrario, un mensaje de error.
#“-l”: Devuelve la longitud del arreglo
#“-i”: Imprime todos los elementos del arreglo en pantalla

if ( $# -lt 1 ); 
then
  echo "No se pasaron los parametros correctos"
  exit 1
else
  usuarios=$(cat /etc/group | grep "users:" | cut -d ":" -f 4)
  j=0
  vector=()
  for i in $usuarios
  do
    vector[j]=$i
    let j++
  done
  case $1 in 
    "-b")
      if [ $2 -gt $(expr ${#vector[*]} -1) ];
      then
        echo "La posicion se va de rango"
      else
        echo "El elemento en la posicion $2 es: ${vector[$2]}"
      fi
    ;;
    "-l")
      echo "Longitud: ${#vector[*]}"
    ;;
    "-i")
      echo "Elementos del vector:  ${vector[*]}"
    ;;
  esac
fi
exit 0
