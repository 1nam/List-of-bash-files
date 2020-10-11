#!/bin/bash
#1nam   make a webpage and create the html file to launch it.

read -p "Background Color?: " color
read -p "Text Color?: " Tcolor
read -p "name of website?: " site_name
read -p "your welcome header?: " head1
read -p "Write a Paragraph: " paragraph

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
</html>" > $site_name.html
