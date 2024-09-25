#!/bin/bash

folder=$1

# assumes there is only one fastq-run-info.tsv in the folder,
# which should be true if the raw data of only one project was
# downloaded and stored in the input folder.


tail -n +2 $folder/fastq-run-info.tsv | cut -f1,135 | while IFS=$'\t' read -r run_accession sample_alias; do

	old_fwd=${run_accession}_1.fastq.gz
	old_rev=${run_accession}_2.fastq.gz

	new_fwd=${sample_alias}_1.fastq.gz
	new_rev=${sample_alias}_2.fastq.gz

	mv $old_fwd $new_fwd ; mv $old_rev $new_rev

done


