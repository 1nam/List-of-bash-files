#!/bin/bash
# 1nam testing pipe
# how to use | pipe
# the output of cpuinfo is pipe | to less info
# pressing enter to view all info.
# press q to end and return to terminal.

cat /proc/cpuinfo | less
