#!/bin/bash

echo "Course Name: $course" # accessing env variable

# To set an environment variable, use the export command
export course="DevOps"
echo "Course Name: $course"

#enter in terminal ~/.bashrc
#add export course="DevOps" at the end of the file
#source ~/.bashrc
#echo $course   this will print DevOps and logout and login again it will print DevOps it 
#will be permanent until you remove that line from .bashrc file
#or you can also add in /etc/profile file to make it available for all users