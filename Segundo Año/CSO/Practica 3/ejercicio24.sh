#!/bin/bash

#Dada la definición de 2 vectores del mismo tamaño y cuyas longitudes no se conocen.
#Complete este script de manera tal de implementar la suma elemento a elemento entre
#ambos vectores y que la misma sea impresa en pantalla de la siguiente manera:
#La suma de los elementos de la posición 0 de los vectores es 6
#...
#La suma de los elementos de la posición 4 de los vectores es 10

vector1=(1 3 5 7 9)
vector2=(2 4 6 8 10)

for ((i=0; i < ${#vector1[*]}; i++))
do
    echo "La suma de los elementos de la posicion ${i} es $(expr ${vector1[$i]} + ${vector2[$i]})"
done
exit 0
