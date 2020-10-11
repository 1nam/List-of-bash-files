#!/bin/bash
# 1nam make a text game

# ************** Text Game **********************************

# ************** part one flashlight.

read -p "you walk in to a dark room you need a?: " input1

if [[ $input1 == flashlight ]]
then
echo "you can see now! there is a backpack on the floor"  
else 
echo "Hint: flashlight"
fi 

# ************** part two yes or no. backpack

read -p "do you pick the backpack up?: " input2

if [[ $input2 == yes ]]
then
echo "you pick up the backpack unzip it theres a notebook"
elif [[ $input2 == no ]]
then
echo "you walk further in the room."
else 
echo "Hint: yes or no"
fi 
