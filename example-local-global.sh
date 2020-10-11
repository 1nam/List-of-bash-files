#!/bin/bash
# 1nam how to use local and global variable

Global="1 Global" # Global can be used everywhere.

function one(){  # function name is one.

    local VAR="1 local" # local can only be used in a function.

    echo "this is a Global $Global" # this will execute.
    echo "this is a Local $VAR"     # this will execute.

}
one # closing function one.
# this is out side the function.
echo "this is a Global $Global"     # this will execute. becouse its global
echo "this is a Local $VAR"         # this will NOT execute. becouse its local
