#!/bin/bash
USERID=$(id -u)     #get user id of current user
R="\e[31m"  #Red
G="\e[32m" #Green
Y="\e[33m"] #Yellow
N="\e[0m"  #No Color white

LOGS_FLODER="/var/log/shell-scripts"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1))
LOGS_FILE="$LOGS_FLODER/$SCRIPT_NAME.log"

mkdir-p "$LOGS_FLODER"
echo "script started at : $(date)"

if [ $USERID -ne 0 ]; then 
    echo " ERROR:: please run this script as root privileges"
    exit 1          #failure is other then 0
fi 

VALIDATE(){                  #Functions recevive input to /Aguments just like scripts arguments
    if [ $1 -ne 0 ]; then
        echo "ERROR :: $2 .. $R failure $N"
        exit 1           #exit with failure status 
    else
        echo "installing $2 ..$G success $N"
    fi
}



dnf install mysql -y                    &>>$LOGS_FILE
#install if it is not found
if [ $? -ne 0 ]; then
    dnf install mysql -y                &>>$LOGS_FILE
else
    echo -e "mysql is already exit ... $Y skipping $N"
fi
      
VALIDATE $1 "MYSQL INSTALLATION"

dnf install nginx -y       &>>$LOGS_FILE
if [ $? -ne 0 ]; then
    dnf install nginx -y   &>>$LOGS_FILE
else
    echo -e "ngnix is already exit ... $Y skipping $N"
fi
      
VALIDATE $1 "nginx INSTALLATION"

dnf install python3 -y     &>>$LOGS_FILE
if [ $? -ne 0 ]; then
dnf install python3 -y     &>>$LOGS_FILE
else
    echo -e "ngnix is already exit ... $Y skipping $N"
fi
      

VALIDATE $1 "python3 INSTALLATION"
