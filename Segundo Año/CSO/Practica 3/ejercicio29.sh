#!/bin/bash

#Implemente un script que agregue a un arreglo todos los archivos del directorio /home cuya
#terminación sea .doc. Adicionalmente, implemente las siguientes funciones que le permitan
#acceder a la estructura creada:
#verArchivo <nombre_de_archivo>: Imprime el archivo en pantalla si el mismo se encuentra en el
#arreglo. Caso contrario imprime el mensaje de error “Archivo no encontrado” y devuelve como valor de retorno 5
#cantidadArchivos: Imprime la cantidad de archivos del /home con terminación .doc
#borrarArchivo <nombre_de_archivo>: Consulta al usuario si quiere eliminar el archivo lógicamente. 
#Si el usuario responde Si, elimina el elemento solo del arreglo. Si el usuario responde No, 
#elimina el archivo del arreglo y también del FileSystem. Debe validar que el archivo exista en el arreglo.
#En caso de no existir, imprime el mensaje de error “Archivo no encontrado” y devuelve como valor de retorno 10

arreglo=()
indice=0
for i in $(find /home -name "*.doc")
do
  arreglo[indice]=$i
  let indice++
done 

function verArchivo {
  esta=0
  for i in ${arreglo[*]}
  do
    if ( = $1)
    then
      esta=1
      break
    fi
  done
  if ( $esta -eq 1 )
  then
    cat $1
  else
    echo "Archivo no encontrado"
    exit 5
  fi
}

function cantidadArchivos {
  echo "Cantidad de archivos con terminacion .doc dentro del directorio home: ${#arreglo[*]}"
}

function borrarArchivo {
  
}
