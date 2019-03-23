linea=0
comprobador=0
grupoMaxUsuarios=""
comparadorMaxUsuarios=0

while [ $comprobador -eq 0 ]; do
    read -p "Introduzca un nombre de fichero: " fichero
    if [ -f $fichero ]; then
	comprobador=1
	for i in $(cat $fichero | cut -d ":" -f 1); do
	    linea=$(($linea+1))
	done
	echo "En el fichero proporcionado tenemos $linea grupos"
	for n in $(cat $fichero | cut -d ":" -f 1); do
	    numeroLinea=$(($numeroLinea+1))
	    for y in $(cat $fichero | cut -d ":" -f 2 | head -$numeroLinea | tail -1); do
		numeroUsuarios=$(($numeroUsuarios+1))
	    done
	    echo "El grupo $n tiene $numeroUsuarios usuarios"
	    if [ $numeroUsuarios -gt $comparadorMaxUsuarios ]; then
		comparadorMaxUsuarios=$numeroUsuarios
		grupoMaxUsuarios=$n
	    fi
	    numeroUsuarios=0
	done
	echo "El grupo con mas usuarios es $grupoMaxUsuarios"
    else
	echo "El fichero no existe"
    fi
done

    
