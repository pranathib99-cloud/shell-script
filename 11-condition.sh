#!/bin/bash

echo "read number the command line argument"
read NUMBER

if (($NUMBER % 2)) #modulus operator
then
    echo "given number $NUMBER is odd"
else
    echo "given number $NUMBER is even"
fi  