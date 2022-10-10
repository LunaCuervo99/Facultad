#!/bin/bash

#Dada la siguiente declaración al comienzo de un script: num=(10 3 5 7 9 3 5 4) (la cantidad
#de elementos del arreglo puede variar). Implemente la función productoria dentro de este
#script, cuya tarea sea multiplicar todos los números del arreglo

num=(10 3 5 7 9 3 5 4)

function producto { 
    produc=1
    for i in ${num[*]}
    do
        let produc=produc*${i}
    done
    echo "total: ${produc}"
}

producto num
exit 0
