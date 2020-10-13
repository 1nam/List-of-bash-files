#!/bin/bash
# 1nam testing functions and Local - Global variables
# Local variables only show in that function
# to show all variables use Global variables

Princess="riveris" #<--Global variable out side of both functions.

function story1 ()
{ 
local King="zeus" #<--Local variable in the function
local Queen="epica" #<--Local variable in the function
local Prince="zions" #<--Local variable in the function
echo "
This Story is About King $King Queen $Queen and Price $Prince 
I will only use First names to tell the story 
$King said he was sitting on the throne and saw a ghost
His son $Prince saw it as well
When $King wife $Queen heard of this she was shocked
what about Princess $Princess" #<--Global variable inside the function
}
story1

echo "$Princess" #<--Global variable outside the function will show in and out of function.

echo "$King $Queen $Prince" #<-- Lcoal variable outside the function will not show.

function story2 ()
{
    echo "$King $Queen $Prince"
    echo "Local variables from function story1 will not show here in function story2."
    echo "Global variable Princess $Princess" #<--Global variable will show in and out of all functions.
}
story2
