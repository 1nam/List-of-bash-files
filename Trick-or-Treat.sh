#!/bin/bash
# 1nam   testing Happy halloween enjoy!

read -p "The Choice is yours trick or treat: " Q
if [[ $Q == "treat" ]]
then
echo "Nice lil treat your shell enviroment."
sleep 3
set | less
elif  [[ $Q == "trick" ]]
then
yes "Happy halloween!!! [CTRL]-[+]-[C] ENDS LOOP"
sleep 3
clear
exit 0
fi
