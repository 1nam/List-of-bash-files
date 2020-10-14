#!/bin/bash
# 1nam really simple input and display using image magik
# download an image of a shirt name it tshirt.jpeg keep on desktop.
# keep this script on desktop and execute it ./input-display.sh

clear
echo "Welcome to the clothing Store!"
echo ""
echo "enter an item name example: tshirt"
echo ""
read -p "item: " raw
if [[ $raw == "tshirt" ]]
then
display tshirt.jpeg
else
echo "We dont sell that item sorry..."
sleep 2
fi
clear
exit
