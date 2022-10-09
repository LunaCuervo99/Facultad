#!/bin/bash

#Escribir un script que al ejecutarse imprima en pantalla los nombre de los archivos que se
#encuentran en el directorio actual, intercambiando minúsculas por mayúsculas, además de
#eliminar la letra a (mayúscula o minúscula). Ejemplo, directorio actual:
#IsO pepE Maria
#Si ejecuto: ./ejercicio17, obtendré como resultado:
#iSo PEPe mRI
#Ayuda: Investigar el comando tr

for i in $(ls -l);
do
    if [ -f $i ];
    then
        echo ${i} | tr "[:lower:][:upper:] [:upper:][:lower:]" | tr -d "Aa"
    fi
done
exit 0
