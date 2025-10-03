#!/bin/bash

#everything is shell is considered as string
#but we can use them as different data types based on context

NUMBER1=100       #integer
NUMBER2=200      #integer

sum=$((NUMBER1 + NUMBER2))  #arithmetic operation
echo "Sum: $sum"