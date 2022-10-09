#!/bin/bash

#Realice un script que simule el comportamiento de una estructura de PILA e implemente
#las siguientes funciones aplicables sobre una estructura global definida en el script:
#push: Recibe un parámetro y lo agrega en la pila pop: Saca un elemento de la pila
#length: Devuelve la longitud de la pila print: Imprime todos elementos de la pila

pila=()

function length {
    echo "La longitud de la pila es: ${#pila[*]}"
}
function push {
    pila[${#pila[*]}]=$1
}
function pop {
    unset pila[${#pila[*]}1]
}
function print {
    echo "${pila[*]}"
}

#Acá tendria que llamar a los metodos que quiera usar
