#!/bin/bash
#1nam  testing user input these are not real covid-19 Statistics simply an example.

while true
do
clear
echo ""
echo "Covid-19 Chances...Choose: store school home sports"
echo ""
echo "Entering no text and pressing enter exits."
echo ""
read -p "Where would you like to go?: " travel
if [[ $travel == "store" ]]
then
echo "you have a 60% chance of getting covid-19!"
sleep 3
clear
elif [[ $travel == "school" ]]
then
echo "you have a 90% chance of getting covid-19!"
sleep 3
clear
elif [[ $travel == "home" ]]
then
echo "you have a 10% chance of getting covid-19!"
sleep 3
clear
elif [[ $travel == "sports" ]]
then
echo "you have a 95% chance of getting covid-19!"
sleep 3
clear
else
echo "Please enter text."
clear
exit
fi
done
