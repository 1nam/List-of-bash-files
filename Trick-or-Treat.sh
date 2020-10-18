#!/bin/bash
# 1nam   testing Happy Halloween enjoy!

read -p "The Choice is yours trick or treat: " Q
if [[ $Q == "treat" ]]
then
echo "Nice lil treat your shell enviroment."
sleep 3
set | less
elif  [[ $Q == "trick" ]]
then
yes "Happy Haloween!!! [CTRL]-[+]-[C] ENDS LOOP"
sleep 3
clear
exit 0
fi
