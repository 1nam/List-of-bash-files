#!/bin/bash
# easy to fetch your json file and make sure its valid.
# Linux terminal bash
# Using GitHub raw link 
# Check if valid JSON
# View JSON with jq

echo " "
read -p "GitHub raw URL: " raw
echo " "

validate_json() {
    local json_string="$1"
    echo "$json_string" | jq empty &>/dev/null
    if [ $? -eq 0 ]; then
        echo "Valid JSON"
    else
        echo "Invalid JSON"
    fi
}

# Fetch raw data
json_data=$(curl -s "$raw")

# Check if the URL is valid (basic check for non-empty response)
if [ -z "$json_data" ]; then
    echo "Error: Unable to fetch data from URL"
    exit 1
fi

# Validate JSON
validate_json "$json_data"
echo " "

# Pause for a moment to let the user see "Valid JSON"
sleep 3

# Display JSON with jq
echo "$json_data" | jq
echo " "
