USERID=$(id -u)     #get user id of current user
R="\e[31m"  #Red
G="\e[32m" #Green
Y="\e[33m"] #Yellow
N="\e[0m"  #No Color white

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



dnf install mysql -y
#install if it is not found
if [ $? -ne 0 ]; then
    dnf install mysql -y
else
    echo -e "mysql is already exit ... $Y skipping $N"
fi
      
VALIDATE $1 "MYSQL INSTALLATION"

dnf install nginx -y
if [ $? -ne 0 ]; then
    dnf install nginx -y
else
    echo -e "ngnix is already exit ... $Y skipping $N"
fi
      
VALIDATE $1 "nginx INSTALLATION"

dnf install python3 -y
if [ $? -ne 0 ]; then
dnf install python3 -y
else
    echo -e "ngnix is already exit ... $Y skipping $N"
fi
      

VALIDATE $1 "python3 INSTALLATION"