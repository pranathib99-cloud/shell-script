#!/bin/bash

USERID=$(id -u)     #get user id of current user


if [ $USERID -ne 0 ]; then 
    echo " ERROR:: please run this script as root privileges"
fi 

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR :: mysql installation is failure"
else
    echo "mysql install success"
fi