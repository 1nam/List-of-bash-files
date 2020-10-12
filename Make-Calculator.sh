#!/bin/bash
# 1nam testing expr, and made a simple calculator.


while true
do
clear
read -p "First number: " first
read -p "Second number: " second
read -p "Math symbol: " math
expr $first $math $second
read -p "Press enter or q to exit: " input
if [[ $input == "q" ]]
then
clear
exit
fi
done
