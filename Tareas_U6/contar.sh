#!/bin/bash

file="GenusA_speciesA_CAP_R1.fq.gz"
if [[ ! -s "$file" ]]; then

 echo "el archivo está vacio o no existe"

    exit 0

fi

lines=$(zcat GenusA_speciesA_CAP_R1.fq.gz | wc -l)

echo $lines

echo $((lines%4))

if [[ $((lines%4)) -ne 0 ]]; then

    echo "error archivo, el numero de lineas no es divisible en 4"

    exit 0
fi
