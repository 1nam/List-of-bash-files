#!/bin/bash
# 1nam using mplayer to take 3 cam shots to use for a  gif.

mplayer tv:// -tv driver=v4l2:device=/dev/video0:width=640:height=480 -frames 3 -vo jpeg
