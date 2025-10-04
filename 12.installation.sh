#!/bin/bash

USERID=$(id -u)     #get user id of current user


if [ $USERID -ne 0 ]; then 
    echo " ERROR:: please run this script as root privileges"
    exit 1          #failure is other then 0
fi 


dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR :: mysql installation is failure"
    exit 1           #exit with failure status 
else
    echo "mysql install success"
fi