#!/bin/bash

USERID=$(id -u)


R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


if [ $USERID -ne 0 ]; then
     echo "ERROR:: Please run this script with root privelege"
     exit 1 # failure is other then 0
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
     echo -e "ERROR:: Installing $2 ... $R is Failure $N"
     exit 1
else
     echo -e "Installing $2 ... $G SUCCESS $N"
fi    

}

dnf list installed mysql

if [ $? -ne 0 ]; then
   dnf install mysql -y
   VALIDATE $? "MySQL"
else
   echo "MySQL already exist ... $Y SKIPPING $N"
fi       
      

dnf list Installed nginx
   dnf install nginx -y
   VALIDATE $? "Nginx"
else
   echo "Nginx already exist ... $Y SKIPPING $N"
fi      

dnf list Installed python3
   dnf install python3 -y
   VALIDATE $? "python"
else
   echo "Python already exist ... $Y SKIPPING $N"
fi      
