#!/bin/bash

folder=$1

# Loop over files with _1.fastq.gz extension
for file in $folder/*_1.fastq.gz; do
    # Extract the base name without extension
    base_name=$(basename "$file" .fastq.gz)

    # Decompress the file
    gunzip -c "$file" |
    # Modify the content: replace " " with "/1" and remove everything after the white space
    awk '{sub(/ .*/, "/1", $0); print}' |
    # Compress the modified content and save to new file with mod_ prefix
    gzip > "mod_${base_name}.fastq.gz"

    echo "Processed: $folder/${base_name}.fastq.gz"
done


# Loop over files with _2.fastq.gz extension
for file in $folder/*_2.fastq.gz; do
    # Extract the base name without extension
    base_name=$(basename "$file" .fastq.gz)

    # Decompress the file
    gunzip -c "$file" |
    # Modify the content: replace " " with "/2" and remove everything after the white space
    awk '{sub(/ .*/, "/2", $0); print}' |
    # Compress the modified content and save to new file with mod_ prefix
    gzip > "mod_${base_name}.fastq.gz"

    echo "Processed: $folder/${base_name}.fastq.gz"
done
