#!/bin/bash
#1nam testing network.

echo "Find Website ipv4 Address."

read -p "Enter website Address: " site

host $site

sleep 5

echo "Lets test ping!"

sleep 5

ping -c 5 $site  # the 5 is the amount of pings.

sleep 5

echo "This is how many router hops your packet takes to the website you ping."

sleep 5

traceroute $site
