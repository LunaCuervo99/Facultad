#!/bin/bash

#Implemente un script que recorra un arreglo compuesto por números e imprima en pantalla
#sólo los números pares y que cuente sólo los números impares y los informe en pantalla al
#finalizar el recorrido.

arreglo=(1 2 3 4 5 6 7 8 9 10)
impares=0
for i in ${arreglo[*]}
do
    if [ $(expr ${i} % 2) -eq 0 ];
    then
        echo ${i}
    else    
        let impares++
    fi
done
echo "la cantidad de numeros impares es : ${impares}"
exit 0
