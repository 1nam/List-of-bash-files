#!/bin/bash
# 1nam testing gzip

read -p "please name the new zip file: " raw
echo "i was made using gzip" > $raw
gzip $raw

read -p "would you like to unzip the Document?: " raw2

if [[ $raw2 == "yes" ]]
then
gunzip $raw
    elif [[ $raw2 == "no" ]]
    then
    echo "thank you for using gzip!"
    else
    echo "Please try Again."
fi
