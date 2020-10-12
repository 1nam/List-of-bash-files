#!/bin/bash
# 1nam testing alsamixer
# turn Volume all the way up or down and test.
# this script changes Volume up or down to the number you give.

read -p "Enter Volume Number: " raw1    #Example 23
read -p "Enter Volume + or - : " raw2   #Example +
amixer set Master $raw1%$raw2           #Example Volume is now turned up 23%

# type alsamixer in terminal to check Volume. or speaker on desktop tray.
