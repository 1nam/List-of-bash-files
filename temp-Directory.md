############    Opening terminal by default the path is the home Directory.  ####################

                            Simply copy & Paste Commands from this tutorial
         tutorial for creating a .temp directory. and to create an executable bash script
                                  
 
.................................................................................................
###########  Make a new .temp Directory & Work inside the new .temp Directory  ##################

mkdir .temp     <----------- makes the .temp Directory

cd .temp       <------------ changes Directory from home to .temp

.................................................................................................
###################################  Make a Shell Script test.sh   ##############################

touch test.sh   <-------------- creates the test.sh shell script

..................................................................................................
#########################   #list scripts inside .temp directory  ################################

ls       <------------- List files in the current directory

...................................................................................................
####################  Make Script executable. & List executable scripts. ##########################

chmod +x test.sh     <------------ Makes test.sh executable

ls -a -l             <---------- List all files and long list of files showing exectuable files.

...................................................................................................
#####################################    Edit test.sh Script   ####################################

nano test.sh      <----open test.sh script within terminal using a built in text editor named nano  

...........  copy&paste Between doted lines Add to test.sh from nano  ..............................

#!/bin/bash
# your-name-here

echo "Hello World"                #echo prints a string of text inside the quotations
sleep 3                           #sleeps 3 seconds
echo "Good Bye Crule World..."    #echo prints a string of text inside the quotations
sleep 3                           #sleeps 3 seconds
clear                             #clear all text in terminal
exit                              #exit script

.....................................................................................................

#####################################  #save test.sh script from nano  ##############################

ctrl + x                 <---- used to exit but will ask to save first.
press the y key         <----- y for yes to save
press the enter key     <----- press enter to keep the same name test,sh

......................................................................................................
#####################################  Execute Script from terminal.  ###############################

./test.sh          <-----   ./    used to ececute the script

......................................................................................................
