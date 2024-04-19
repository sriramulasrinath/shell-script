#/bin/bash

USERID=$(id -u)

VALIDATE(){
    echo "Exit status: $1"
    echo "what are you doing: $2"
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



