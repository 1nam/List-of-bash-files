#!/bin/bash   #ABOUT-shebang path to bash where the magic happens.

# adding -e to shebang returning a "onzero status" the script will "terminate"
# adding -x to shebang print an execution trace "Debug"

#1nam   Loop a Clean Menu 4 options 5 commands

######################## READY FOR CODE/COMMANDS ##################################

while true                        # while its true do something
do                                # do it
clear                             # keep the screen loop clean
echo "Tell about Menu..."         # print on screen name of script or info
echo " "                          # blank echo for style
read -p "1,2,x,h: "input          # print options and get input
case $input in                    # case users-input in 1,2,x,h then do something.
1) code ;;                        # add one code/command to option 1
2) code                           # 1st add two codes/commands to option 2
   code ;;                        # 2nd
x) exit ;;                        # exit the script option x
h) echo "Offer A Help Menu..."    # option h
esac                              # using case as menu close case writing it backwards
done                              # simply done
