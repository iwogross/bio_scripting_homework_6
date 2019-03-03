#!/bin/bash
read -p "Input search term: " term

for i in ./book_pages/*.txt
do
lines=`cat $i | grep -in $term | cut -d \: -f 1 | awk 'BEGIN { ORS = " " } { print }'`
count=`grep -ic "$term" $i`

if [ "$count" -gt 1 ]; then
     printf "The file $i contains at least $count instances of the string '$term' on $count lines: $lines\n\n" >> output_GROSS.txt
elif [ "$count" -eq 1 ]; then
    printf "The file $i contains at least $count instance of the string '$term' on $count line: $lines\n\n" >> output_GROSS.txt
else
    printf "The file $i contains $count instances of the string '$term'.\n\n" >> output_GROSS.txt
fi
done
