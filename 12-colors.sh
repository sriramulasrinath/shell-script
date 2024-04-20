#/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
N="\e[0m"

echo "Script started executing at: $TIMESTAMP"

VALIDATE(){
    if [ $1 -ne 0 ]
    then    
        echo -e "$2....FAILURE $N"
        exit 1
    else    
        echo -e "$2...SUCCESS $G"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "Please run with the root access."
    exit 1
else
    echo "You are the Super User."
fi

dnf install mysql -y &>>$LOGFILE
VALIDATE $? -e "Installing mysql $G"

dnf install git -y &>>$LOGFILE
VALIDATE $? -e "Installing git $G"

dnf install dockerr -y &>>$LOGFILE
VALIDATE $? -e "Installing docker $G"

echo "is script proceeding?"


