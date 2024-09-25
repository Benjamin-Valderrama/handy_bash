## Bash scripts dump

These are scripts I used for different goals/analyses that are part of almost every microbiome project.

While these scripts may be useful for other microbiome scientists, the repository wasn't created for other people to use the scripts here available. Therefore, if you do so, proceed with caution.

## Small description for the scripts per folder
* **fastq_prep**
	* aggregate_lanes.sh: 

	Often the same biological sample is sequenced in different lanes to increase the sequencing depth. This generates many files that contain reads of the same sample, and we often would like to aggregate all those files into just one. This script does that. The approch followed is to just append the reads of each lane one after the other. If other more sophisticated approaches are required, then consider use other scripts.

	* rename_teagasc_fastqfiles.sh: 

	It changes the identifier of forward and reverse reads from `*_R{1,2}_001.fastq.gz` (used by the sequencing company we work with) to more the standard `_{1,2}.fastq.gz`

	* swap_accession_to_alias.sh:

	Sometimes when people submit their fastq files to ENA they forgot to use the same sample accession number for files generated during the sequenciation of the same sample in different lanes. This can mislead the analysis as files from the same sample are treated as comming from different sample just because they were sequenced in different lanes, and because of the mistake of the person who submits the files to ENA in not correctly labeling it. However, sometimes the information in the column 'sample_alias' can tell you what sample each fastq file actually comes from, and we can use that information to fix the mislabelling. If you, like me, download fastq files with [fastq-dl](https://github.com/rpetit3/fastq-dl), then this can be done easy. After fastq-dl downloads the fastq files, it also downloads the file report as a tsv file. In the file you can find the run accessions of each fastq file and the sample alias. This script allows to rename fastq files from their run accessions to their reported sample aliases.
