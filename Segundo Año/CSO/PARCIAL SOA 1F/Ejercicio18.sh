18)
#!/bin/bash

function cantidad() {
    echo "${#arreglo[*]}"
}

function listar() {
    echo "${arreglo[*]}"
}

function eliminar() {
    if [ $# -lt 2 ]; then
        echo "NO es la cantidad de parametros requerida"
        exit 1
    elif [ $1 -gt ${#arreglo[*]} ]; then
        echo "te pasaste con el indice"
        exit 2
    fi
    case $2 in 
        "l" )
            listar
            unset arreglo[$1]
            listar
        ;;
        "f" )
            rm "${arreglo[$1]}"
            listar
            unset arreglo[$1]
            echo "fijate si lo borre"
            listar
        ;;
        * )
            echo "no es una opcion correcta"
            exit 3
        ;;
    esac
}

count=0
for i in $(find ${pwd} -name "*ejercicio*")
do
    arreglo[count]=$i
    let count++
done
select opcion in cantidad listar eliminar fin
do
    case $opcion in
        "cantidad" )
            cantidad
        ;;
        "listar" )
            listar
        ;;
        "eliminar" )
            echo "parametros"
            read parametro1
            read parametro2
            eliminar $parametro1 $parametro2
        ;;
        "fin" )
            exit 0
        ;;
    esac
done
