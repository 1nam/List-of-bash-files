#!/bin/bash
# Hot Shot – Zenity GUI version (fully silent terminal)
# Saves snapshots in ./hot_stuff folder same directory as script.
# opens gimp with the photo ready to edit and add fx.

# Get script directory
SCRIPT_DIR="$(dirname "$(realpath "$0")")"

# Create hot_stuff folder if it doesn't exist
DEST_DIR="$SCRIPT_DIR/hot_stuff"
mkdir -p "$DEST_DIR"

# Generate filename with timestamp
FILENAME="$DEST_DIR/snapshot_$(date +%Y%m%d_%H%M%S).jpg"

# Instruction dialog
zenity --info \
       --title="Hot Shot" \
       --text="Click OK to take your snapshot.\nPlease have your pose ready!\nThe photo will open in GIMP immediately." \
       --no-wrap >/dev/null 2>&1

# Capture snapshot silently
ffmpeg -f v4l2 -video_size 640x480 -i /dev/video0 -frames:v 1 "$FILENAME" -y >/dev/null 2>&1

# Notify user and open GIMP
zenity --info \
       --title="Hot Shot" \
       --text="Snapshot saved as $FILENAME\nGIMP is opening for you to add effects." \
       --no-wrap >/dev/null 2>&1

gimp "$FILENAME" >/dev/null 2>&1 &
