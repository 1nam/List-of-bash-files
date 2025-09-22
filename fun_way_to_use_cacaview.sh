#!/bin/bash
# 🌟 Interactive Terminal Image Gallery with arrow keys, mini ASCII, emojis, voice, and proper viewing
# simply use arrow keys to scroll through ascii images click enter on one image and view it on cacaview

# optional if you wanna ask for a directory simple.
# read -p "Directory: " D
# DIR=~/$D

DIR=~/Pictures

# ANSI colors
GREEN="\e[32m"
CYAN="\e[36m"
YELLOW="\e[33m"
RED="\e[31m"
BOLD="\e[1m"
RESET="\e[0m"
REVERSE="\e[7m"

# Enable nullglob to avoid literal patterns if no files match
shopt -s nullglob
images=($DIR/*.{png,jpg,jpeg,gif})

if [ ${#images[@]} -eq 0 ]; then
    echo -e "${RED}No images found in $DIR${RESET}"
    exit 1
fi

# Cheeky greeting with voice
greeting=("Want to find an image? Ha ha ha! 😏" "Ohh you cheeky monkey! 🐒" "Prepare for ASCII magic! ✨")
rand_greet=${greeting[$RANDOM % ${#greeting[@]}]}
spd-say "$rand_greet" &
echo -e "${BOLD}${CYAN}=== 🌟 Terminal Image Gallery 🌟 ===${RESET}"
echo -e "${YELLOW}(Use ↑ ↓ arrows to navigate, Enter to open, q to quit)${RESET}"
echo ""
echo -e "${CYAN}$rand_greet${RESET}"
sleep 1

selected=0

draw_gallery() {
    clear
    echo -e "${BOLD}${CYAN}=== 🌟 Terminal Image Gallery 🌟 ===${RESET}"
    echo -e "${YELLOW}(Use ↑ ↓ arrows to navigate, Enter to open, q to quit)${RESET}"
    echo ""

    for i in "${!images[@]}"; do
        emoji="🖼️"
        [[ "${images[$i]}" =~ cat ]] && emoji="🐱"
        [[ "${images[$i]}" =~ dog ]] && emoji="🐶"
        [[ "${images[$i]}" =~ gif ]] && emoji="🎞️"

        if [ $i -eq $selected ]; then
            echo -e "${REVERSE}${GREEN}$i) $(basename "${images[$i]}") $emoji${RESET}${REVERSE}"
            # Mini preview for selected item
            chafa --size=30x10 --fill=block "${images[$i]}"
        else
            echo -e "${GREEN}$i) $(basename "${images[$i]}") $emoji${RESET}"
        fi
        echo ""
    done
}

# Enable arrow key reading
stty -echo -icanon time 0 min 0

while true; do
    draw_gallery
    read -rsn1 key 2>/dev/null

    if [[ $key == $'\x1b' ]]; then
        read -rsn2 key2
        key+=$key2
        if [[ $key == $'\x1b[A' ]]; then
            ((selected--))
            ((selected<0)) && selected=$((${#images[@]}-1))
        elif [[ $key == $'\x1b[B' ]]; then
            ((selected++))
            ((selected>=${#images[@]})) && selected=0
        fi
    elif [[ $key == "" ]]; then
        # Enter pressed
        phrases=("Opening magic... 🪄" "Hold on, ASCII coming! 😎" "Enjoy your art! 🎨")
        rand_phrase=${phrases[$RANDOM % ${#phrases[@]}]}
        spd-say "$rand_phrase" &

        # Restore terminal for cacaview
        stty echo icanon
        cacaview "${images[$selected]}"
        # Re-enable raw mode
        stty -echo -icanon time 0 min 0

        sleep 3  # pause after viewing before redrawing gallery
    elif [[ $key == "q" ]]; then
        stty echo icanon   # restore terminal settings
        echo -e "${BOLD}👋 Bye!${RESET}"
        sleep 1
        clear              # clean up the terminal
       
        break
    fi
done

# Restore terminal settings
stty echo icanon
