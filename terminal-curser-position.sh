#!/bin/bash
# 1nam Testing tput cup terminal curser postion.

clear
tput cup 10 5                 # setting postion tput cup x, y
read -p 'Enter Name: ' raw

if [[ $raw -eq $raw ]]
then
clear && echo "Good Evening $raw." && tput cup 0 20 # setting postion tput cup x, y
sleep 2
clear
fi
