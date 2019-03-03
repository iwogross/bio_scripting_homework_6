#!/bin/bash

#This script counts the numbers of lines a given search term is present on, and prints a summary statement. 

#Creating file and term variables with a prompt.
read -p "Input file name: " file
read -p "Input search term: " term

#This creates a variable called lines. It creates a string of numbers identifying lines that contain the variable $term in $file. 
lines=`cat $file | grep -in $term | cut -d \: -f 1 | awk 'BEGIN { ORS = " " } { print }'`

#Similar, but instead I am pulling the line count for all lines containing $term in $file, *none-case-sensitive*! 
count=`grep -ic "$term" $file`

#Syntax conditionals, just for readability
if [ "${count}" -gt 1 ]; then
     printf "The file $file contains at least $count instances of the string '$term' on $count lines: $lines\n"
elif [ "${count}" -eq 1 ]; then
    printf "The file $file contains at least $count instance of the string '$term' on $count line: $lines\n"
else
    printf "The file $file contains $count instances of the string $term.\n"
fi
