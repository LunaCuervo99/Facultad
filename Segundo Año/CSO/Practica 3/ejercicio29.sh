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

function verArchivo(){
	for ((i=0;i<${#array[@]};i++))
	do
		if [ $1 = ${array[i]} ];
		then
			echo "Se encontro el archivo $1"
			return 0
		fi
	done
	echo "Archivo $1 no encontrado"
	return 5
} 

function cantidadArchivos {
  echo "Cantidad de archivos con terminacion .doc dentro del directorio home: ${#arreglo[*]}"
}


function borrarArchivo() {
	pos=0
	for file in ${array[*]}
	do
		if [ $1 == ${array[pos]} ];
		then
			echo "Quiere eliminar el archivo $1 logicamente?"
			select opcion in Si No
			do	
			case $opcion in
			"Si")
				unset array[pos]
				return 0
			;;
			"No")
				unset array[pos]
				rm $1
				return 0
			;;
			*)
				echo "Opcion incorrecta"
				return 1
			esac
			done
		else
			let pos++
		fi
	done
	if [ $pos -ge ${#array[@]} ];
	then
		echo "Archivo $1 no encontrado"
		return 10
	fi
}

#Lleno el arreglo
for file in $(find /home -name "*.doc")
do
	nombre=$(basename $file)
	array+=($nombre)
done

verArchivo ejercicioBORRAR.doc
cantidadArchivos
borrarArchivo ejercicioBORRAR.doc
cantidadArchivos
