#!/bin/bash
# 1nam psychic game

a="As_I_see__yes"
b="Ask_later"
c="Cant_tell_you_now"
d="Maybe_ask_again"

echo " "
read -p "Ask your Question: " raw
echo " "
echo "Looks in to the Crystal Ball..."
sleep 4
echo " "
echo "Ahh i see now..."
sleep 3
echo " "
while true;
do
shuf -e -z $a $b $c $d | more
echo " "
break
done
