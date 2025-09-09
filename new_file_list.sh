#!/bin/bash
# ✅ Progress counter [current/total] so you know where you are.

# ✅ Green color for readability.

# ✅ Cleaner spacing and prompts.

# ✅ Preserves the 1.5-second delay for “teleprompter effect.”

# Wait for user to start
read -p "Press Enter to start listing files..."
clear

# Count total files
total_files=$(ls -1 | wc -l)
counter=0

# Loop through files
for file in *; do
    ((counter++))
    # Print with hostname, user, file number, and color
    echo -e "\e[32m$HOSTNAME $USER [$counter/$total_files]:\e[0m $file"
    sleep 1.5
done

# Exit prompt
read -p "Press Enter to exit."
clear
exit
