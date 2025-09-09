#!/bin/bash
# changes

# Use \r to return to the start of the line.

# Make the output always the same width (pad with spaces if needed).

# Don’t use echo with automatic newline; use printf.

seconds=21600  # 6 hours

while [ $seconds -ge 0 ]; do
    # Convert seconds to HH:MM:SS
    h=$((seconds/3600))
    m=$((seconds%3600/60))
    s=$((seconds%60))
    printf "\r⏳ Timer: %02d:%02d:%02d remaining  " $h $m $s

    sleep 1
    ((seconds--))
done

echo -e "\n✅ Finished!"
