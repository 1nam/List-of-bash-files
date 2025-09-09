#!/bin/bash
# LIVE 🎤 blinks while each line is shown.

# Big font preserved on selected lines.

# At the end, OFF AIR ⚠️ blinks at the top for a few seconds.

# Feels like a real broadcast start and finish.
# Messages with optional big font
# Format: "BIG|Message" or "NORMAL|Message"
lines=(
    "BIG|Welcome: This is Station Reporting live from City, State. I'm Your Name."
    "NORMAL|News: Local area stories."
    "BIG|Ad: Will be right back after this break."
    "NORMAL|Weather: Some weather conditions."
    "NORMAL|Sponsor: And now a word from our sponsor..."
    "NORMAL|Guess: On this day or year, something happened."
    "BIG|Sign_off: From Station, City, State. I'm Your Name. Have a good evening..."
)

# Function to print lines with optional big font
print_line() {
    local mode="$1"
    local text="$2"
    echo " "
    if [[ $mode == "BIG" ]]; then
        printf "\033#6%s\n" "$text"  # Big font
    else
        printf "%s\n" "$text"
    fi
}

# Function to show blinking text at top
blink_message() {
    local message="$1"
    local duration="$2"
    local end=$((SECONDS + duration))
    while [ $SECONDS -lt $end ]; do
        printf "\r\e[5m%s\e[25m   " "$message"
        sleep 0.5
        printf "\r%s" "           "
        sleep 0.5
    done
}

# Start teleprompter
clear
echo "Teleprompter Starting..."
sleep 2
echo " "

# Loop through messages
for entry in "${lines[@]}"; do
    mode="${entry%%|*}"
    text="${entry#*|}"

    # Start blinking LIVE 🎤 in background
    blink_message "LIVE 🎤" 4 &  # blink for 4 seconds
    blink_pid=$!

    # Print the line (big font if needed)
    print_line "$mode" "$text"

    # Wait for blink to finish
    wait $blink_pid
done

# Show OFF AIR ⚠️ blinking at the top
blink_message "OFF AIR ⚠️" 6  # blink for 6 seconds

echo -e "\nTeleprompter Stopped."
