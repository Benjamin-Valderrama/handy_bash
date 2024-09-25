#!/bin/bash

# path to folder with fastq files from different lanes
folder=$1

# Change to the specified directory
#cd "$FOLDER" || exit

# Create an associative array to store the grouped files
declare -A file_groups

# Loop through the files in the directory. The scripts assumes that a maximum of four
# lanes were used for each sample. This is the standard behaviour of our sequencing company,
# but it can be changed by adding more lanes in two places:
# 	*_{L001,L002,L003,L004} (in the line where the for loop starts)
#	's_L[1234]_' (in the line where base_name is defined)

for file in ${folder}/*_{L001,L002,L003,L004}_{1,2}.fastq.gz; do

  # Extract the base name up to _L001 or _L002, and the suffix (_1.fastq.gz or _2.fastq.gz)
  base_name=$(echo "$file" | sed -E 's/_L00[1234]_[12].fastq.gz//')
  suffix=$(echo "$file" | grep -oE '_[12].fastq.gz')

  # Create a key with base name and suffix
  key="${base_name}${suffix}"
  # Add the file to the group in the associative array
  file_groups["$key"]+="$file "

done

# Process each group of files
for key in "${!file_groups[@]}"; do

	echo $key
	echo ${file_groups["$key"]}

  # Aggregate files from each lane to a new file
  zcat ${file_groups["$key"]} | gzip > "${key}"

done
