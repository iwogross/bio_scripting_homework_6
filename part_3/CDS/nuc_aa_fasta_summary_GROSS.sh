#!/bin/bash

for i in *.cds
do
basename=`basename ${i} .cds`

# Script for FASTA descriptor truncation and complete summarization (with histogram)
cat ${i} | cut -d ' ' -f 1 | ./get_fasta_stats.pl -g -T > ${basename}_GROSS.dna
# Solo truncation pipe to prepare for transeq
cat ${i} | cut -d ' ' -f 1 > ${basename}_temp_GROSS.dna

# Translates temp.dna FASTA code with truncated descriptors into amino acid sequence
transeq -sformat pearson -frame 1 -sequence ${basename}_temp_GROSS.dna -outseq ${basename}_GROSS.pep
done

for i in *.pep
do
base=`basename ${i} _GROSS.pep`
# This loop takes previous .pep file and creates a full FASTA summary and a per-contig summary
./get_fasta_stats.pl -t ${base}_GROSS.pep > ${base}_GROSS.summary
done


