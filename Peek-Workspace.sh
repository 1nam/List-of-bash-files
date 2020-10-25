#!/bin/bash
#1nam  
# i have 2 workspaces i use one for scripting the other for daily use
# while im watching a movie on the daily use workspace i need to peek in 
# on code im writing so i just run this script
# i made using xdotool Just press x whenever i need to switch workspaces 
# i have a 10 second sleep timer set. just adjust it to your needs.

while true
do
clear
echo "Peek at another workspace for 10 seconds"
echo "Press x to Peek"
read -p "Start: " UI
if [[ $UI == "x" ]]
then
xdotool set_desktop --relative 1
sleep 10  #<--------------------------#adjust sleep 10 seconds                       
xdotool set_desktop --relative 1
elif [[ $UI != "x" ]]
then
echo "good Bye..."
sleep 2
clear
break
fi
done
