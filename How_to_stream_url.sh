#!/bin/bash

# Required: sudo apt install mpv curl
# This script plays SomaFM streams from the terminal with a menu.
# Function to display ASCII art
jam_out(){
echo "
MMMMMMMMMMMMMMMMMMWKkl;.        ..,lkKWMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMWKkl;..               ..;lkKWMMMMMMMMMMMMMMMMM
MMMMMMMMMMMWKd;.                         .;o0WMMMMMMMMMMMMMM
MMMMMMMMMW0c.      .':coxOOOkxdolc'         .:kNMMMMMMMMMMMM
MMMMMMMMXo.      'o0NMMMMMMMMMMMMMNOd;.        ,xNMMMMMMMMMM
MMMMMMW0;      .oXMMMMMMMMMMMMMMMMMMMWKx;        ,OWMMMMMMMM
MMMMMNx.     .cKWMMMMMMMMMMMMMMMMMMMMMMMXd.       .oNMMMMMMM
MMMWKl.     .dNMMMMMMMMMMMMMMMMMMMMMMMMMMW0:.       :KMMMMMM
MMMk.      'kWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNk'       ,OWMMMM
MMWx.   .;dOO0KXNNNWWMMMMMMMMMMMMMMMMMMMMMMMW0:       'kWMMM
MMMNx.  .lkXWXK0Okdd0WMMMMMMMMMMMMMMMMMMMMMMMMXo.      '0MMM
MMNk,      'oxdl::dKWMMMMMMMMMMMMMMMMMMMMMMMMMKo'      .OMMM
MKc..',,'         .;OWMMMMMMMMMMMMMMMMMMMMMMMMWXO;    .dNMMM
O, .'.              .kWMMMMMMMMMMMMMMMMMMMMWKkddkkdd; .:kXWM
' ..                 ,KMMMMMMMMMMMMMMMMMMNx;.    .'c'    .lK
 ..                  .dWMMMMMMMMMMMMMMMMK:            ...  l
..                    cNMMMMMMMMMMMMMMMK:              .'' c
.                     cNMMMMMMMMMMMMMMXc                  .d
,                     cNMMMMMMMMMMMMMWd.                  '0
                      oWMMMMMMMMMMMMMk.                   .O
,                    .kMMMMMMMMMMMMMX:                     '
Nd.                  cXMMMMMMMMMMMMMx.                      
MNd.                '0MMMMMMMMMMMMMWl                      c
MMW0l,.            'kWMMMMMMMMMMMMMN:                    .xN
MMMMMW0c..       .cKWMMMMMMMMMMMMMMNc                   .xWM
MMMMMMMWX0kdc::co0WMMMMMMMMMMMMMMMMWl                  .xWMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMk.                ;0WMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWk'             'dNMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMXkolcc;,co; .dXWMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWWMWl.lNMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWl,0MMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNloWMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM0ckMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMkc0MMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWooNMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMKlxMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMOcOMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWdlXMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNooWMMMMMMMMMMM
"
}
jam_out

# Check for mpv
command -v mpv >/dev/null 2>&1 || {
    echo >&2 "mpv is not installed. Please run: sudo apt install mpv"
    exit 1
}

# Soma FM Channels and Stream URLs
declare -A CHANNELS=(
    ["1"]="Groove Salad - Chillout and downtempo"
    ["2"]="Drone Zone - Ambient and drone music"
    ["3"]="Indie Pop Rocks - Indie and alternative"
    ["4"]="Lush - Sensual and mellow vocals"
)

declare -A STREAM_URLS=(
    ["1"]="http://ice1.somafm.com/groovesalad-128-mp3"
    ["2"]="http://ice1.somafm.com/dronezone-128-mp3"
    ["3"]="http://ice1.somafm.com/indiepop-128-mp3"
    ["4"]="http://ice1.somafm.com/lush-128-mp3"
)

# Function to play stream
play_stream() {
    stop_stream  # Stop any existing stream
    echo "Playing: ${CHANNELS[$1]}"
    mpv "${STREAM_URLS[$1]}" --no-video &
    STREAM_PID=$!
}

# Function to stop stream
stop_stream() {
    if [ -n "$STREAM_PID" ] && kill -0 "$STREAM_PID" 2>/dev/null; then
        echo "Stopping current stream..."
        kill "$STREAM_PID"
        unset STREAM_PID
    fi
}

# Function to show stream info
stream_info() {
    echo "Available Channels:"
    for key in "${!CHANNELS[@]}"; do
        echo "$key. ${CHANNELS[$key]}"
        echo "   URL: ${STREAM_URLS[$key]}"
    done
}

# Main menu loop
while true; do
    clear
    echo "=============================="
    echo "       Soma FM Menu           "
    echo "=============================="
    echo "1. Play Groove Salad"
    echo "2. Play Drone Zone"
    echo "3. Play Indie Pop Rocks"
    echo "4. Play Lush"
    echo "5. Stop Stream"
    echo "6. Show Stream Info"
    echo "7. Exit"
    echo "=============================="
    read -p "Choose an option [1-7]: " option

    case "$option" in
        1|2|3|4)
            play_stream "$option"
            ;;
        5)
            stop_stream
            ;;
        6)
            stream_info
            read -p "Press Enter to return to menu..." pause
            ;;
        7)
            stop_stream
            echo "Exiting... Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            sleep 1
            ;;
    esac
done
