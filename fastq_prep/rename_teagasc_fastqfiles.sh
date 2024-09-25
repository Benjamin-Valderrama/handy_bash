#!/bin/bash

# folder where fastq files to rename are located
folder=$1

for file in ${folder}/*.fastq.gz; do

	# rename forward reads
	if [[ "$file" == *_R1* ]]; then
		mv $file ${file/_R1_001/_1}
	fi

	# rename reverse reads
	if [[ "$file" == *_R2* ]]; then
		mv $file ${file/_R2_001/_2}
	fi

done
