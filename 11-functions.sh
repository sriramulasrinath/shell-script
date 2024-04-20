#/bin/bash

USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then    
        echo "$2....FAILURE"
        exit 1
    else    
        echo "$2...SUCCESS"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "Please run with the root access."
    exit 1
else
    echo "You are the Super User."
fi

dnf install mysql -y
VALIDATE $? "Installing mysql"

dnf install git -y
VALIDATE $? "Installing git"


echo "is script proceeding?"



