#!/bin/bash

echo "enter a number"
read NUMBER

if (($NUMBER % 2)) #modulus operator
then
    echo "given number $NUMBER is odd"
else
    echo "given number $NUMBER is even"
fi  