#!/bin/bash
# 1nam audio testing with mplayer

# simple yes or no and the name of the movie or song.
# dont have to add what codec it uses or a path to file.
# dont have to add your log in name to any path. 
# this script uses the logged in users path to Music and Videos.
# dont have to put this script in the same directory as Music or Videos.  use it anywhere. 


echo "Play any Movie or Song"                  # just a title of the script printed out.

read -p "is this a Movie?: " input             # ask and get input yes or no 

read -p "name of the Song or Movie: " input2   # ask and get user input song or movie name

if [[ $input == yes  ]]                        # if yes or no do something.

then

mplayer  /home/$USER/Videos/$input2.mp4        # if its a movie get input2 and play it.

elif [[ $input == "no" ]]                      # elif its no do something.
then

mplayer  /home/$USER/Music/$input2.mp3         # get input2 song name and play it.

fi  
