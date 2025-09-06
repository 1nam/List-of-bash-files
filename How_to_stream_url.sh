#!/bin/bash

# before using this script install:  sudo apt install mpv curl
# the script depends on mpv to play streams.
#these streams are free to listen to here--> https://somafm.com/
# this script plays the streams in terminal with a menu
# option to pick a stream to play
# also shows current station playing
# option to choose stream url, stop, exit

# Soma FM Channels
declare -A CHANNELS
CHANNELS=(
    ["1"]="Groove Salad - Chillout and downtempo"
    ["2"]="Drone Zone - Ambient and drone music"
    ["3"]="SomaFM - Indie Pop Rocks"
    ["4"]="Lush - Chillout and downtempo"
)

# Corresponding Stream URLs
STREAM_URLS=(
    "http://ice1.somafm.com/groovesalad-128-mp3"
    "http://ice1.somafm.com/dronezone-128-mp3"
    "http://ice1.somafm.com/indiepop-128-mp3"
    "http://ice1.somafm.com/lush-128-mp3"
)

# Function to play the stream
play_stream() {
    echo "Playing ${CHANNELS[$1]}..."
    mpv "${STREAM_URLS[$1]}" &
    STREAM_PID=$!
}

# Function to stop the stream
stop_stream() {
    if [ -n "$STREAM_PID" ]; then
        echo "Stopping the stream..."
        kill "$STREAM_PID"
        unset STREAM_PID
    else
        echo "No stream is currently playing."
    fi
}

# Function to show stream info
stream_info() {
    echo "Available Channels:"
    for key in "${!CHANNELS[@]}"; do
        echo "$key. ${CHANNELS[$key]}"
    done
}

# Main menu loop
while true; do
    echo "=============================="
    echo "       Soma FM Menu          "
    echo "=============================="
    echo "1. Play Groove Salad"
    echo "2. Play Drone Zone"
    echo "3. Play Indie Pop Rocks"
    echo "4. Play Lush"
    echo "5. Stop Stream"
    echo "6. Stream Info"
    echo "7. Exit"
    echo "=============================="
    read -p "Choose an option [1-7]: " option

    case $option in
        1)
            play_stream 0
            ;;
        2)
            play_stream 1
            ;;
        3)
            play_stream 2
            ;;
        4)
            play_stream 3
            ;;
        5)
            stop_stream
            ;;
        6)
            stream_info
            ;;
        7)
            stop_stream
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
done
