#!/bin/bash
#1nam  testing and  making a game Rock Paper Scissors

while true
do
clear
echo " "
echo "Rock Paper Scissors [g] To start Game... [x] to exit..."
echo " "
read -p "The Choice is yours: " pick3
echo " "
case $pick3 in
x) exit;;
g) shuf -e -z ,rock, ,paper, ,scissors,;;
esac
echo " "
echo -e "Try Again? Press enter..."
echo " "
read input
done
