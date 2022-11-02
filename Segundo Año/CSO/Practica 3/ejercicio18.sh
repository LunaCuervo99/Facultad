#!/bin/bash

#Crear un script que verifique cada 10 segundos si un usuario se ha loqueado en el sistema
#(el nombre del usuario será pasado por parámetro). Cuando el usuario finalmente se loguee,
#el programa deberá mostrar el mensaje ”Usuario XXX logueado en el sistema” y salir.

if [ $# -eq 1 ];
then
    if [ $(cat /etc/passwd | cut -d ":" -f 1 | grep -w $1 | wc -l) -eq 0 ];
    then
        echo "No existe ese usuario"
        exit 2
    else
        while true
        do
            seLogueo=`who | grep $1 | wc -l`
            if [ $seLogueo != 0 ]
            then
                echo "usuario $1 logueado"
            fi
            sleep 10 
        done
    fi
else
    echo "No se paso la cantidad de parametros correcta"
    exit 1
fi
