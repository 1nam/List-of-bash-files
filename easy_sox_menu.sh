#!/bin/bash

# Function to display the menu
show_menu() {
    echo "=============================="
    echo "         SoX Command Menu     "
    echo "=============================="
    echo "1. Convert audio file format"
    echo "2. Trim audio file"
    echo "3. Change audio volume"
    echo "4. Combine audio files"
    echo "5. Add sound effects"
    echo "6. Get audio file info"
    echo "7. Exit"
    echo "=============================="
}

# Function to convert audio file format
convert_audio() {
    read -p "Enter input file name (with extension): " input_file
    read -p "Enter output file name (with extension): " output_file
    sox "$input_file" "$output_file"
    echo "Converted $input_file to $output_file"
}

# Function to trim audio file
trim_audio() {
    read -p "Enter input file name (with extension): " input_file
    read -p "Enter start time (e.g., 00:00:30): " start_time
    read -p "Enter duration (e.g., 00:01:00): " duration
    read -p "Enter output file name (with extension): " output_file
    sox "$input_file" "$output_file" trim "$start_time" "$duration"
    echo "Trimmed $input_file to $output_file"
}

# Function to change audio volume
change_volume() {
    read -p "Enter input file name (with extension): " input_file
    read -p "Enter output file name (with extension): " output_file
    read -p "Enter volume change (e.g., 2 for double, 0.5 for half): " volume
    sox "$input_file" "$output_file" vol "$volume"
    echo "Changed volume of $input_file to $output_file"
}

# Function to combine audio files
combine_audio() {
    read -p "Enter input file names (space-separated): " input_files
    read -p "Enter output file name (with extension): " output_file
    sox $input_files "$output_file"
    echo "Combined files into $output_file"
}

# Function to add sound effects
add_effects() {
    read -p "Enter input file name (with extension): " input_file
    read -p "Enter output file name (with extension): " output_file
    echo "Choose an effect to apply:"
    echo "1. Reverb"
    echo "2. Echo"
    echo "3. Chorus"
    read -p "Enter your choice (1-3): " effect_choice

    case $effect_choice in
        1) sox "$input_file" "$output_file" reverb ;;
        2) sox "$input_file" "$output_file" echo 0.8 0.88 60 0.4 ;;
        3) sox "$input_file" "$output_file" chorus 0.7 0.9 55 0.4 0.25 2 -t 0.3 ;;
        *) echo "Invalid choice, no effect applied." ; return ;;
    esac
    echo "Applied effect to $input_file and saved as $output_file"
}

# Function to get audio file info
get_audio_info() {
    read -p "Enter input file name (with extension): " input_file
    sox --i "$input_file"
}

# Main loop
while true; do
    show_menu
    read -p "Choose an option (1-7): " option

    case $option in
        1) convert_audio ;;
        2) trim_audio ;;
        3) change_volume ;;
        4) combine_audio ;;
        5) add_effects ;;
        6) get_audio_info ;;
        7) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid option, please try again." ;;
    esac
done
