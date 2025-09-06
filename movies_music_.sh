#!/bin/bash
# mplayer must be installed to use this script
# if yes for movie sets path to your video directory 
# if no movie sets path to your music directory
# simply add your codec
# name of song or movie
# movies bring up mplayer video
# songs play in terminal
# Function to display error messages
display_error() {
    echo -e "\e[31m$1\e[0m"  # Red text for error messages
    sleep 3  # Pause to allow the user to read the error message
}

# Dragon ASCII Art
dragon_art() {
    echo "          __====-_  _-====__"
    echo "      _--^^^#####//      \\#####^^^--_"
    echo "   _-^##########// (    ) \\##########^-_"
    echo "  -############//  |\^^/|  \\############-"
    echo " -#############//   (@::@)   \\#############-"
    echo " -#############((      \\//      ))#############-"
    echo " -#############\\     (oo)     //#############-"
    echo "  -#############\\    / '' \\    //#############-"
    echo "   -#############\\  /      \\  //#############-"
    echo "    -#############\\/        \\//#############-"
    echo "      -###########\\          //############-"
    echo "        -##########\\        //##########-"
    echo "          -##########\\      //########-"
    echo "            -##########\\    //######-"
    echo "              -##########\\  //####-"
    echo "                -##########\\/##-"
    echo "                  -##########-"
}

# Display the dragon art
dragon_art

echo -e "\e[32mWelcome to the Movie and Song Player!\e[0m"  # Green welcome message
echo "Supported codecs: mp3, mp4, ogg"

# Prompt for codec input
read -p "Enter codec: " x

# Function to play a movie
play_movie() {
    local movie_path="/home/$USER/Videos/$1.$x"
    if [[ -f "$movie_path" ]]; then
        mplayer "$movie_path"
    else
        display_error "Error: Movie '$1.$x' not found in Videos directory."
    fi
}

# Function to play a song
play_song() {
    local song_path="/home/$USER/Music/$1.$x"
    if [[ -f "$song_path" ]]; then
        mplayer "$song_path"
    else
        display_error "Error: Song '$1.$x' not found in Music directory."
    fi
}

# Main script
echo "Play any Movie or Song"

read -p "Is this a movie? (yes/no): " input
input=${input,,}  # Convert input to lowercase for case insensitivity

read -p "Name of the Song or Movie: " input2

if [[ $input == "yes" ]]; then
    play_movie "$input2"  # Call function to play movie
elif [[ $input == "no" ]]; then
    play_song "$input2"  # Call function to play song
else
    display_error "Invalid input. Please enter 'yes' or 'no'."
fi

# Clear the screen after the script ends
clear

