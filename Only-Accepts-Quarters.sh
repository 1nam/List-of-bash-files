#!/bin/bash
# 1nam testing make a coin slot that Only accepts Quarters


while true
do
clear
echo "Please insert one Quarter."
read -p "Coin Slot--> " change
expr $change - 25
if [[ $change == "25" ]]
then
echo "Thank you!"
sleep 2
clear
exit 
elif [[ $change != "25" ]]
then
echo "More Change Needed... Only accepts Quarters."
sleep 2
fi
read -p "Press enter or q to exit: " raw
if [[ $raw == "q" ]]
then
clear
fi
done
