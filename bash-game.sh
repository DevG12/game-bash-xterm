#!/bin/bash


#preparar terminal
oldstty=$(stty -g)
clear
echo -e "\033[2J"
exec < /dev/tty

#selector de mapas
source "./mapas-remastered.sh"

#eliminar el arhivo posicion.txt
#rm posicion.txt

#eliminar representacion de echo
stty raw -echo min 0

#movimiento del cursor + monitorizar la posicion del cursor
while true
do
    read -s -n 1 entrada
    case $entrada in
    w)
        echo -en '\033[1A'
        echo -en "\033[6n" > /dev/tty
        IFS=';' read -r -d R -a pos
        row=$((${pos[0]:2}))
        col=$((${pos[1]}))
        ok="no"
        for (( i=0 ; i<${#lineam1[@]} ; i++ )); do
            for (( n=0 ; n<${#meta[@]} ; n++ )); do 
                if [ "$row;$col" == ${lineam1[$i]} ]; then
                    ok="si"
                    break
                elif [ "$row;$col" == ${meta[$n]} ]; then
                    ok="si"
                    clear 
                    echo "Te has pasado el mapa $mapa"
                    sleep 1
                    stty "$oldstty"
                    exit 0
                fi
            done
        done
        if [ $ok = "no" ]; then
            clear
            echo "Has perdido... Vuelve a intentarlo"
            sleep 1
            stty "$oldstty"
            exit 0
        fi
    ;;
    a)
        echo -en '\033[1D'
        echo -en "\033[6n" > /dev/tty
        IFS=';' read -r -d R -a pos
        row=$((${pos[0]:2}))
        col=$((${pos[1]}))
        ok="no"
        for (( i=0 ; i<${#lineam1[@]} ; i++ )); do
            for (( n=0 ; n<${#meta[@]} ; n++ )); do 
                if [ "$row;$col" == ${lineam1[$i]} ]; then
                    ok="si"
                    break
                elif [ "$row;$col" == ${meta[$n]} ]; then
                    ok="si"
                    clear 
                    echo "Te has pasado el mapa $mapa"
                    sleep 1
                    stty "$oldstty"
                    exit 0
                fi
            done
        done
        if [ $ok = "no" ]; then
            clear
            echo "Has perdido... Vuelve a intentarlo"
            sleep 1
            stty "$oldstty"
            exit 0
        fi
    ;;
    s)
        echo -en '\033[1B'
        echo -en "\033[6n" > /dev/tty
        IFS=';' read -r -d R -a pos
        row=$((${pos[0]:2}))
        col=$((${pos[1]}))
        ok="no"
        for (( i=0 ; i<${#lineam1[@]} ; i++ )); do
            for (( n=0 ; n<${#meta[@]} ; n++ )); do 
                if [ "$row;$col" == ${lineam1[$i]} ]; then
                    ok="si"
                    break
                elif [ "$row;$col" == ${meta[$n]} ]; then
                    ok="si"
                    clear 
                    echo "Te has pasado el mapa "
                    sleep 1
                    stty "$oldstty"
                    exit 0
                fi
            done
        done
        if [ $ok = "no" ]; then
            clear
            echo "Has perdido... Vuelve a intentarlo"
            sleep 1
            stty "$oldstty"
            exit 0
        fi
    ;;
    d)
        echo -en '\033[1C'
        echo -en "\033[6n" > /dev/tty
        IFS=';' read -r -d R -a pos
        row=$((${pos[0]:2}))
        col=$((${pos[1]}))
        ok="no"
        for (( i=0 ; i<${#lineam1[@]} ; i++ )); do
            for (( n=0 ; n<${#meta[@]} ; n++ )); do 
                if [ "$row;$col" == ${lineam1[$i]} ]; then
                    ok="si"
                    break
                elif [ "$row;$col" == ${meta[$n]} ]; then
                    ok="si"
                    clear 
                    echo "Te has pasado el mapa $mapa"
                    sleep 1
                    exit 0
                fi
            done
        done
        if [ $ok = "no" ]; then
            clear
            echo "Has perdido... Vuelve a intentarlo"
            sleep 1
            stty "$oldstty"
            exit 0
        fi
    ;;
    q)
        echo -e "\033[2J"
        echo "Saliendo..."
        sleep 2
        clear
        stty "$oldstty"
        exit 0
        
    esac
done