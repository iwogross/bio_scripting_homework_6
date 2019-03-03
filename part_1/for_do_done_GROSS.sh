#!/bin/bash
# This script can search multiple .txt documents for a given search term, and identifies the # of lines it is found on, and the specific line numbers.
# The summary for each file is printed to a single .txt file.

#Creating a variable for the prompted search term
read -p "Input search term: " term

#For loop starts to analyze each .txt file
for i in ./book_pages/*.txt
do
# Identifies lines with $term, then removes the line number at the start of the string, and flips the list to a horizontal orientation on one line
lines=`cat $i | grep -in $term | cut -d \: -f 1 | awk 'BEGIN { ORS = " " } { print }'`

# Identifies the number of lines with $term
count=`grep -ic "$term" $i`

# Syntax conditionals to be exported in a summary .txt document.
if [ "$count" -gt 1 ]; then
     printf "The file $i contains at least $count instances of the string '$term' on $count lines: $lines\n\n" >> output_GROSS.txt
elif [ "$count" -eq 1 ]; then
    printf "The file $i contains at least $count instance of the string '$term' on $count line: $lines\n\n" >> output_GROSS.txt
else
    printf "The file $i contains $count instances of the string '$term'.\n\n" >> output_GROSS.txt
fi

#Done-zo
done
