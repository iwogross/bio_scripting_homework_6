#!/bin/bash

for i in *.cds
do
basename=`basename ${i} .cds`
cat ${i} | cut -d ' ' -f 1 | ./get_fasta_stats.pl -g -T > ${basename}_GROSS.dna
cat ${i} | cut -d ' ' -f 1 > ${basename}_temp_GROSS.dna
transeq -sformat pearson -frame 1 -sequence ${basename}_temp_GROSS.dna -outseq ${basename}_GROSS.pep
done

for i in *.pep
do
base=`basename ${i} _GROSS.pep`
./get_fasta_stats.pl -t ${base}_GROSS.pep > ${base}_GROSS.summary
done


