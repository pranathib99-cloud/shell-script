USERID=$(id -u)     #get user id of current user
R="\e[31m"  #Red
G="\e[32m" #Green
Y="\e[33m"] #Yellow
N="\e[0m"  #No Color white

LOGS_FLODER="/var/log/shell-scripts"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1)
LOGS_FILE="$LOGS_FLODER/$SCRIPT_NAME.log"

mkdir -p "$LOGS_FLODER"
echo "script started at : $(date)"  | tee -a $LOGS_FILE

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

# $@ - all arguments passed to script
for package in $@
do
    #check if package is installed or not
    if [ $? -ne 0 ]; then
        dnf install $package -y &>>$LOGS_FILE  
        VALIDATE $? "$package" 
    else
        echo -e "$package is already exit ... $Y skipping $N"  
    fi
done