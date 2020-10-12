#!/bin/bash
# 1nam testing loop, controlling a loop with user input.

while true
do
clear

echo "3"
sleep 1

echo "2"
sleep 1

echo "1"
sleep 1

clear

echo "Finished..."

read -p "Press enter or q to exit: " input

if [[ $input == "q" ]]
then
exit
fi
done
