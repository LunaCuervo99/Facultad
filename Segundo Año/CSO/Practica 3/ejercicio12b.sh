#!/bin/bash

#Modificar el script creado en el inciso anterior para que los números sean recibidos
#como parámetros. El script debe controlar que los dos parámetros sean enviados.

if [[ $# -lt 2 ]]; then
	echo "No se paso la cantidad correcta de parametros"
	exit 1
fi

echo "El 1er numero es: $1"
echo "El 2do numero es: $2"
echo "La multiplicacion da: `expr $1 \* $2`"
echo "La suma da: `expr $1 + $2`"
echo "La resta da: `expr $1 - $2`"

if [ $1 -gt $2 ]; then
    echo "$1 es mayor que $2"
else 
    echo "$2 es mayor que $1"
fi
