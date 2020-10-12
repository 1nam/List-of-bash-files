#!/bin/bash
# 1nam testing laptop brightness.

xrandr | grep " connected" | cut -f1 -d " "
read -p "Copy & Paste Name Above To Here: " raw1
read -p "Enter Brightness LVL Example 0.9: " raw2
xrandr --output $raw1 --brightness $raw2
