#!/bin/bash

USERID=$(id -u)     #get user id of current user


if [ $USERID -ne 0 ]; then 
    echo " ERROR:: please run this script as root privileges"
    exit 1          #failure is other then 0
fi 
VALIDATE(){                  #Functions recevive input to /Aguments just like scripts arguments
    if [ $1 -ne 0 ]; then
        echo "ERROR :: $2 is failure"
        exit 1           #exit with failure status 
    else
        echo "$2 is success"
    fi
}

dnf install mysql -y
VALIDATE $1 "MYSQL INSTALLATION"

dnf install nginx -y 
VALIDATE $1 "NGINX INSTALLATION"

dnf install python3 -y
VALIDATE $1 "python3 INSTALLATION"