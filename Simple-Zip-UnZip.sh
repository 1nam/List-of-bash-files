#!/bin/bash
#1nam   
# enter directory or folder name where the file is.
# enter the name of the file to zip or unzip
# case sensitive Directory example: Documents File name example: my_file.txt 
# zip and upzip using gzip and gunzip this is a lil script i made for it.

# -k  keep (don't delete) input files-"Keeps Original."
# -p  prompt output 

while true
do
clear

read -p "Directory of File: " directory
read -p "File name to zip: " name

echo "zipping $name "
echo ""
gzip -k /home/$USER/$directory/$name

echo "sleeping 3 seconds."
echo ""
sleep 3
read -p "unzip?: " maybe
if [[ $maybe == "no" ]]
then
clear
exit
elif [[ $maybe == "yes" ]]
then
echo "unzipping $name "
echo ""
gunzip /home/$USER/$directory/$name.gz
clear
exit
elif [[ $maybe == "YES" ]] || [[ $maybe == "NO" ]]
then
echo "please turn off caps lock..."
sleep 3
clear
exit
else
echo "Please enter yes or no."
sleep 3
clear
exit
fi
done
