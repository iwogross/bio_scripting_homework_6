#!/bin/bash

# Script that clips fasta descriptor names and produces complete FASTA statistics with a histogram
# I sort of combined 3a and 5 script here. 
# Next, transeq translates the sequences at the first reading frame 

cat $1 | cut -d ' ' -f 1 | ./get_fasta_stats.pl -g -T > output_GROSS.dna
cat $1 | cut -d ' ' -f 1 > output_temp_GROSS.dna
transeq -sformat pearson -frame 1 -sequence output_temp_GROSS.dna -outseq output_GROSS.pep

# Finally, a second complete FASTA summary with individual stats for each contig
./get_fasta_stats.pl -t output_GROSS.pep > output_GROSS.summary


