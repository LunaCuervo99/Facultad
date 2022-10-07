#!/bin/bash

#(a) Realizar un script que le solicite al usuario 2 números, los lea de la entrada Standard e imprima
# la multiplicación, suma, resta y cual es el mayor de los números leídos.

echo "Ingrese dos numeros"
read num1 
read num2

echo "La multiplicacion da: `expr $num1 \* $num2`"
echo "La suma da: `expr $num1 + $num2`"
echo "La resta da: `expr $num1 - $num2`"

if [ $num1 -gt $num2 ]; then
    echo "$num1 es mayor que $num2"
else 
    echo "$num2 es mayor que $num1"
fi