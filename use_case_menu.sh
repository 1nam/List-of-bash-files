#!/bin/bash

while true; do
    clear  # Clear the screen at the start of each loop iteration
    echo "Menu:"
    echo "1) Option 1"
    echo "2) Option 2"
    echo "3) Exit"
    read -p "Choose an option: " choice

    case $choice in
        1)
            echo "You chose Option 1."
            sleep 3  # Pause to allow the user to read the output
            clear  # Clear the screen after the pause
            ;;
        2)
            echo "You chose Option 2."
            sleep 3
            clear
            ;;
        3)
            echo "Exiting..."
            sleep 3
            clear
            break  # Exit the loop
            ;;
        *)
            echo "Invalid option. Please try again."
            sleep 3
            clear
            ;;
    esac
done
