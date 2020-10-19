#!/bin/bash
#1nam   make a webpage and create the html file to launch it.
# the html file will be placed were ever this script is executed,
                          #  EXAMPLES --------[--------------------------------]
read -p "Background Color?: " color             # black
read -p "Text Color?: " Tcolor                  # blue
read -p "name of website?: " site_name          # my_cool_site
read -p "your welcome header?: " head1          # Welcome to my site
read -p "Write a Paragraph: " paragraph         # thanks for visiting my site
                           #  EXAMPLES --------[--------------------------------]
echo "<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
<style>
body {
background-color: $color
}
</style>
    <title>$site_name</title>
  </head>
  <body>
  <font size="6" face="verdana" color="$Tcolor">
    <br>
    <center><h1>$head1</h1></center>
  <p>$paragraph</p>
  </font> 
  </body>
</html>" > $site_name.html   # makes html script the you named
