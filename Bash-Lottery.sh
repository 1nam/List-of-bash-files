#!/bin/bash
# 1nam testing random making a bash lottery
# and loop or quit

RANDOM=${RANDOM}
while true
do
clear
echo " "
echo "Play the Bash lottery"
echo " "
echo " press enter For bash lotto numbers q to quit or -h for help "
echo " "
read -p "Press Enter for your Bash Lotto numbers: " input
if [[ $input == "q" ]]
then
clear
exit
elif [[ $input == "-h" ]]
then
echo "Welcom to the Help dialog- press enter For bash lotto numbers q to quit or -h for help. "
sleep 7
clear
exit
fi
for i in $RANDOM
do
echo "Your Bash Lotto numbers are: $RANDOM  Thank you for playing the Bash Lotto"
sleep 5
done # close for
done # close while
