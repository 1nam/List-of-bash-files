#!/bin/bash
# 1nam  make a telepromter for making videos.
# the big text only works in kde Konsle terminal download from software manager.
# adjust sleep as needed for your needs simply change number of seconds.

Welcome="This is Station Reporting live from name of city, state I'm your name."
News="local area storys"
Ad="will be back right back after this break"
Weather="some weather conditions"
Sponser="and now a word from our sponser..."
Guess="this day or year something happend"
Sign_off="from station + name of city, state I'm your name. Have a good evening..."

# ######################### code #########################
echo -e "\e[25m\e[5mTelepromter Started...\e[25m"
# ########################################################
sleep 2
echo " "
printf "\033#6$Welcome\n"
echo " "
sleep 4
printf "\033#6$News\n"
echo " "
sleep 4
printf "\033#6$Ad\n"
echo " "
sleep 4
printf "\033#6$Weather\n"
echo " "
sleep 4
printf "\033#6$Sponser\n"
echo " "
sleep 4
printf "\033#6$Guess\n"
echo " "
sleep 4
printf "\033#6$Sign_off\n"
echo " "
sleep 2
echo " "
echo -e "\e[25m\e[5mTelepromter Stopped...\e[25m"
echo " "
