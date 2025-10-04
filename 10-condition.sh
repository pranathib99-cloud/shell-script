#!/bin/bash

#codition1=true
#condition2=false 
# != nagative
#if [ $codition1 == true ] && [ $condition2 == false ]; then
    echo "both conditions are true"
#elif [ $codition1 == true ] || [ $condition2 == true ]; then
    echo "one of the conditions is true"
#else
    echo "both conditions are false"
#fi


#false*false=false
#false*true=false
#true*false=false
#true*true=true 


#example
NUMBER1=$1

if [ $NUMBER -eq 10 ] ; then
    echo " given number is equal than 10"       #-lt means less than

    else
        echo "given number is greater than or equal to 10"
fi


#-eq  equal to
#-ne  not equal
#-gt  greater than
#-lt  less than
