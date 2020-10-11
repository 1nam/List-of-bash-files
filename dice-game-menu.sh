#!/bin/bash
# 1nam making a dice game with a menu. roll one or two dice.

while true
do
clear
echo "Choose 1 dice or 2 dice  q to exit"
read -p "Make your Choice: " raw
case $raw in
1) echo $(($RANDOM % 6 + 1));;
2) echo $(($RANDOM % 12 + 1));;
q) exit;;
esac
echo -e "Roll Again? Press enter..."
read input
done
