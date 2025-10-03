#!/bin/bash

#everything is shell is considered as string
#but we can use them as different data types based on context

NUMBER1=100       #integer
NUMBER2=200      #integer
NAME=devops  #string
sum=$((NUMBER1 + NUMBER2 + NAME))  #arithmetic operation
echo "Sum: $sum"

LEADERS=( "MODi" "PUTHIN" "kcr" "ktr")

echo "all leaders: ${LEADERS[@]}"  #@ to get all values of names
