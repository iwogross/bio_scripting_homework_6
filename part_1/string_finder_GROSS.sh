#!/bin/bash
read -p "Input file name: " file
read -p "Input search term: " term
lines=`cat $file | grep -in $term | cut -d \: -f 1 | awk 'BEGIN { ORS = " " } { print }'`
count=`grep -c "$term" $file`

if [ "${count}" -gt 1 ]; then
     printf "The file $file contains at least $count instances of the string '$term' on $count lines: $lines\n"
elif [ "${count}" -eq 1 ]; then
    printf "The file $file contains at least $count instance of the string '$term' on $count line: $lines\n"
else
    printf "The file $file contains $count instances of the string $term.\n"
fi
