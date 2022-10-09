#!/bin/bash

#Realizar un script que reciba como parámetro una extensión y haga un reporte con 2
#columnas, el nombre de usuario y la cantidad de archivos que posee con esa extensión. Se
#debe guardar el resultado en un archivo llamado reporte.txt

if [ $# -eq 1]; 
then
    cant=0
    for i in $(ls /home); #Busco en el / todos los archivos que terminen con .extension
    do
        echo $i >> reporte.txt
        for j in (find -name "*.$1")
        do
            let cant++
        done
        echo ${cant} >> reporte.txt
        cant=0
    done
    exit 0
else
    echo "No se paso la cantidad de parametros requerida"
    exit 1
fi
