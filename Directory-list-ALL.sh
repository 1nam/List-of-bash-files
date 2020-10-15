#!/bin/bash
#1nam   testing list all in directory.

read -p "Press enter to start."
clear
for i in *
do
    sleep 1.5
    echo "$HOSTNAME $USER: $i"
done
read -p "Press enter to exit."
clear
exit
