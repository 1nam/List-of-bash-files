#!/bin/bash
# No unnecessary clear.

# Peek moves forward then back, instead of forward twice.

# single read -p makes interaction smoother.

Clean and readable.
while true; do
    read -p "Peek at another workspace for 10 seconds (press x to peek, any other key to quit): " UI

    if [[ $UI == "x" ]]; then
        # Move to next workspace
        xdotool set_desktop --relative 1
        sleep 10  # peek duration
        # Return to original workspace
        xdotool set_desktop --relative -1
    else
        echo "Goodbye..."
        sleep 2
        break
    fi
done
