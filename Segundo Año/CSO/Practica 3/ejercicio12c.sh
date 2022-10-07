#!/bin/bash

#Realizar una calculadora que ejecute las 4 operaciones básicas: +, - ,*, %. Esta calcu-
#ladora debe funcionar recibiendo la operación y los números como parámetros

if [[ $# -lt 3 ]]; then
	echo "No se pasaron suficientes parametros"
	exit 1
fi
case $2 in
	"+" )
		suma=`expr $1 + $3`
		echo "La suma de ambos numeros es de: " 
		echo $suma
	
	;;
	"-" )
		resta=`expr $1 - $3`
		echo "La resta de ambos numeros es de: "
		echo $resta
	;;
	"*" )
		mult=`expr $1 \* $3`	
		echo "La multiplicacion de ambos numeros es de: "
		echo $mult
	;;
	"/" )
		div=`expr $1 / $3`	
		echo "La division de ambos numeros es de: " 
		echo $div
	;;	
esac