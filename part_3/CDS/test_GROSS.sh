#!/bin/bash

cat $1 | cut -d ' ' -f 1 | ./get_fasta_stats.pl -g -T > output_GROSS.dna
cat $1 | cut -d ' ' -f 1 > output_temp_GROSS.dna
transeq -sformat pearson -frame 1 -sequence output_temp_GROSS.dna -outseq output_GROSS.pep

./get_fasta_stats.pl -t output_GROSS.pep > output_GROSS.summary


