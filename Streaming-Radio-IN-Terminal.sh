#!/bin/bash
#1nam  testing Streaming Radio 
# q exits script during streaming.

# Simple Streaming Radio using mplayer and terminal.
# Copy and Paste Streaming Radio URL.
# Get Stream URL here: http://dir.xiph.org/genres/Null
# Listen to Radio y for yes n for no

while true
do
clear
echo "While radio is playing press q to quit"
echo " "
read -p "Add URL: " url
read -p "Listen to Radio? y or n: " maybe
if [[ $maybe == "y" ]]
then
echo `date +"%A %d %b %Y %H:%M:%S"`
echo " "
mplayer -prefer-ipv4 $url
break
exit
elif [[ $maybe == "n" ]]
then
echo "Good Bye..."
sleep 2
clear
exit
else
echo "Please enter y or n"
sleep 2
fi
done
