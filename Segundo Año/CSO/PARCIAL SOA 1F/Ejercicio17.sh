#!/bin/bash

#Ejercioio 17 PRIMERA FECHA 2022

if [ $# -lt 1 ]; then
    echo "cantidad de parametros incorrecta"
    exit 2
fi

if [ $(cat /etc/passwd | grep $1 | cut -d ":" -f1 | wc -l) -eq 0 ]; then
    echo "NO es un usuario existente"
    exit 1
else
    contador=0
    arch="/tmp/acces-$1.log"
    while [ $contador -lt 10 ]  
    do
        seLogueo=$( who | grep $1 | wc -l)
        if [ $seLogueo != 0 ];
        then
            echo "usuario $1 logueado. Agregando al archivo"
            echo "$1 $(date)" >> $arch
            let contador++
        fi
        sleep 5s
    done 
    echo $contador
    exit 0
fi
