#!/bin/bash

# Requirements: jq, curl, ping, traceroute
# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Function to handle quit
quit() {
    echo -e "${RED}Exiting...${NC}"
    sleep 1
    clear
    exit 0
}

# Trap Ctrl+C to quit cleanly
trap quit SIGINT

# Get script directory
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Create logs folder if it doesn't exist
logs_dir="$script_dir/logs"
mkdir -p "$logs_dir"

# GitHub JSON URL
json_url="https://raw.githubusercontent.com/1nam/fetch_quotes/refs/heads/main/websites.json"

# Fetch JSON from GitHub
echo -e "${BLUE}Fetching website list from GitHub...${NC}"
websites=$(curl -s $json_url | jq -r '.websites[]') || quit

if [ -z "$websites" ]; then
    echo -e "${RED}Failed to fetch websites or JSON is empty.${NC}"
    quit
fi

# Pick a random website
site=$(echo "$websites" | shuf -n 1)
echo -e "${CYAN}Randomly selected website: $site${NC}"

# Initialize JSON log
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
log_file="$logs_dir/network_log_$timestamp.json"
echo "{" > "$log_file"
echo "  \"timestamp\": \"$timestamp\"," >> "$log_file"
echo "  \"site\": \"$site\"," >> "$log_file"

# Resolve IP
echo -e "${BLUE}\nResolving IP address...${NC}"
ip=$(host -4 $site | awk '/has address/ {print $4}' | head -n1)
if [ -z "$ip" ]; then
    echo -e "${RED}Failed to resolve IP.${NC}"
    echo "  \"ip\": null," >> "$log_file"
else
    echo -e "${GREEN}IP address: $ip${NC}"
    echo "  \"ip\": \"$ip\"," >> "$log_file"
fi

# Ping test
echo -e "${BLUE}\nTesting ping (5 packets)...${NC}"
ping_result=$(ping -c 5 $site 2>&1)
ping_success=$?
if [ $ping_success -eq 0 ]; then
    echo -e "${GREEN}Ping successful!${NC}"
else
    echo -e "${RED}Ping failed!${NC}"
fi
echo "$ping_result"
echo "  \"ping_success\": $ping_success," >> "$log_file"
echo "  \"ping_output\": \"$(echo "$ping_result" | sed ':a;N;$!ba;s/\n/\\n/g')\"," >> "$log_file"

# Traceroute test
echo -e "${BLUE}\nRunning traceroute...${NC}"
traceroute_result=$(traceroute -4 $site 2>&1)
total_hops=0
failed_hops=0
traceroute_colored=""

while IFS= read -r line; do
    if [[ $line =~ \* ]]; then
        traceroute_colored+="${RED}$line${NC}\n"
        ((failed_hops++))
    else
        traceroute_colored+="${GREEN}$line${NC}\n"
    fi
    ((total_hops++))
done <<< "$traceroute_result"

((total_hops--))  # remove header line from count

echo -e "$traceroute_colored"
echo "  \"total_hops\": $total_hops," >> "$log_file"
echo "  \"failed_hops\": $failed_hops," >> "$log_file"
echo "  \"traceroute_output\": \"$(echo "$traceroute_result" | sed ':a;N;$!ba;s/\n/\\n/g')\"" >> "$log_file"
echo "}" >> "$log_file"

echo -e "${CYAN}\nNetwork log saved to ${log_file}${NC}"

# Offer to read the JSON log with jq
while true; do
    echo -e "${BLUE}\nDo you want to view the JSON log in the terminal using jq? (y/n or q to quit)${NC}"
    read -r view_json
    case $view_json in
        [Yy]* )
            echo -e "${CYAN}\nAvailable jq queries:"${NC}
            echo "1) Full JSON"
            echo "2) IP address"
            echo "3) Ping success"
            echo "4) Total hops"
            echo "5) Failed hops"
            echo "6) Traceroute output"
            echo "q) Quit"
            read -p "Choose an option (1-6 or q): " choice
            case $choice in
                1) jq '.' "$log_file" ;;
                2) jq '.ip' "$log_file" ;;
                3) jq '.ping_success' "$log_file" ;;
                4) jq '.total_hops' "$log_file" ;;
                5) jq '.failed_hops' "$log_file" ;;
                6) jq '.traceroute_output' "$log_file" ;;
                [Qq]* ) quit ;;
                *) echo -e "${RED}Invalid choice.${NC}" ;;
            esac
            ;;
        [Nn]* ) quit ;;
        [Qq]* ) quit ;;
        * ) echo -e "${YELLOW}Please enter y, n, or q.${NC}" ;;
    esac
done
