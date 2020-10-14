#!/bin/bash
# 1nam testing and make a log in and password menu.

while true
do
clear
read -p "user-name: " name
read -p "password-: " pass

if [[ $name == "zeus" ]]
then
echo "Welcome: $name"
sleep 2
elif [[ $name != "zeus" ]]
then
echo "Email of this session sent to Admin."
sleep 2
clear
exit
fi
if [[ $pass == "123" ]]
then
echo "your logged in as $name." 
elif [[ $pass != "123" ]]
then
echo "Email of this session sent to Admin."
sleep 2
clear
exit
fi
done
