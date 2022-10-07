#!/bin/bash

#Crear un script que muestre 3 opciones al usuario: Listar, DondeEstoy y QuienEsta.
#Según la opción elegida se le debe mostrar:
#Listar: lista el contenido del directoria actual.
#DondeEstoy: muestra el directorio donde me encuentro ubicado.
#QuienEsta: muestra los usuarios conectados al sistema.

select opcion in Listar DondeEstoy QuienEsta Exit
do
    case $opcion in 
        Listar )
            ls $pwd
        ;;
        DondeEstoy )
            pwd
        ;;
        QuienEsta )
            who
        ;;
        Exit )
            exit 0
        ;;
    esac
done