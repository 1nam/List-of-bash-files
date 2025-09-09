#!/bin/bash

# Folder blinks continuously at the same speed, independent of typing.

# File names type out letter by letter.

# Hostname/user + progress counter included.

# Wait for user to start
read -p "Press Enter to start listing files..."
clear

# Count total files
total_files=$(ls -1 | wc -l)
counter=0

# Function to type text with blinking folder
type_with_blink() {
    local text="$1"
    local interval=0.05  # typing speed
    local chars=${#text}

    for ((i=0; i<chars; i++)); do
        # Use integer modulo for blink effect
        if (( (i % 6) < 3 )); then  # approximate 0.3s blink
            printf "\r📁 %s" "${text:0:i+1}"
        else
            printf "\r   %s" "${text:0:i+1}"
        fi
        sleep $interval
    done
    echo ""
}

# Loop through files
for file in *; do
    ((counter++))
    prefix="$(echo -e "\e[32m$HOSTNAME $USER [$counter/$total_files]:\e[0m ")"
    type_with_blink "$prefix$file"
done

# Exit prompt
read -p "Press Enter to exit."
clear
exit
