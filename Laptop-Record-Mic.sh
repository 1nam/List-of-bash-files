#!/bin/bash
# 1nam testing arecord
# this records your mic from a laptop for 10 seconds
# then makes a wav file that you named.
# and places the recording in your Music Folder.

echo "Record your Mic to a wav file."

read -p "Name the recording: " raw

arecord /home/$USER/Music/$raw.wav --duration=10  # change time from 10 seconds
