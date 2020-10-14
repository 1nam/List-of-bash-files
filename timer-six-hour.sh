#!/bin/bash
# 1nam testing and making a 6 hour timer.


for i in {1..21600} # there are 21600 seconds in six hours.
do
echo "Six Hour Timer...to Stop Press ctrl + c"
tput cup 10 10 && echo $i
sleep 0.5
echo "Counting..."
sleep 0.5
clear
done
echo "Finished..."
sleep 3
clear
