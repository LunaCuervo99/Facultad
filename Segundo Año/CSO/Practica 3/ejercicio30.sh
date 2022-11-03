#Realice un script que mueva todos los programas del directorio actual (archivos ejecutables)
#hacia el subdirectorio “bin” del directorio HOME del usuario actualmente logueado. El script
#debe imprimir en pantalla los nombres de los que mueve, e indicar cuántos ha movido, o
#que no ha movido ninguno. Si el directorio “bin” no existe,deberá ser creado.

#!/bin/bash
if [ ! -e $HOME/bin ];
then
	mkdir $HOME/bin
	echo "Se creó el directorio bin"
fi
cantidad=0
for file in $(ls)
do
	if [ -x $file ] && [ -f $file ];
	then
		mv $file $HOME/bin/$file	
		echo "Nombre del archivo ejecutable movido: $file"
		let cantidad++
	fi
done
if [ $cantidad -le 0 ];
then
	echo "No se ha movido ningun archivo"
elif [$cantidad -gt 0 ]
then
	echo "La cantidad de archivos movidos es de: $cantidad"
fi
