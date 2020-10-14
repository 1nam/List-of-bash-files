#!/bin/bash
#1nam   testing Whiptail --gauge
# enter any name and pass and a log file is created with name pass and current date.
# log file will be in the same directory as this script.

clear
read -p "user-name: " input1
    read -p "user-pass: " input2
    read -p "To Login press enter"
{
    for ((i = 0 ; i <= 100 ; i+=5)); do
        sleep 1  # Default 0.1
        echo $i
    done
} | whiptail --gauge "Logging in..." 6 50 0
echo $(date +"%m-%d-%Y") "- user-name: $input1 pass: $input2" > log_of_Login.txt
echo "A Log File Has Been Created In The Same Directory As This Script."
sleep 5
clear
exit
