#!/bin/bash

USERID=$(id -u)


R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
mkdir -p $LOGS_FOLDER

echo "Script started executed at: $(date)" | tee -a $LOG_FILE
if [ $USERID -ne 0 ]; then
     echo "ERROR:: Please run this script with root privelege"
     exit 1 # failure is other then 0
fi



VALIDATE(){
    if [ $1 -ne 0 ]; then
     echo -e "ERROR:: Installing $2 ... $R is Failure $N" | tee -a $LOG_FILE
     exit 1
else
     echo -e "Installing $2 ... $G SUCCESS $N" | tee -a $LOG_FILE
fi    

}

dnf list installed mysql &>>$LOG_FILE

if [ $? -ne 0 ]; then
   dnf install mysql -y &>>$LOG_FILE
   VALIDATE $? "MySQL"
else
   echo -e "MySQL already exist ... $Y SKIPPING $N" | tee -a $LOG_FILE
fi       
      

dnf list Installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]; then
   dnf install nginx -y &>>$LOG_FILE
   VALIDATE $? "Nginx"
else
   echo -e "Nginx already exist ... $Y SKIPPING $N" | tee -a $LOG_FILE
fi      

dnf list Installed python3 &>>$LOG_FILE
if [ $? -ne 0 ]; then
   dnf install python3 -y &>>$LOG_FILE
   VALIDATE $? "python"
else
   echo -e "Python already exist ... $Y SKIPPING $N" | tee -a $LOG_FILE
fi      


