## Bash scripts dump

These are scripts I use/have used for different goals/analyses that are part of almost every microbiome project.

While these scripts may be useful for other microbiome scientists, the repository wasn't created for other people to use the scripts here available. Therefore, if you do so, proceed with caution.

## Small description for the scripts per folder
* **fastq_prep**
	* aggregate_lanes.sh: 

	Often the same biological sample is sequenced in different lanes to increase the sequencing depth. This generates many files that contain reads of the same sample, and we often would like to aggregate all those files into just one. This script does that. The approch followed is to just append the reads of each lane one after the other. If other more sophisticated approaches are required, then consider use other scripts.

	* rename_teagasc_fastqfiles.sh: 

	It changes the identifier of forward and reverse reads from `*_R{1,2}_001.fastq.gz` (used by the sequencing company we work with) to more the standard `_{1,2}.fastq.gz`

	* swap_accession_to_alias.sh:

	Sometimes when people submit their fastq files to ENA they forget to use the same `sample accession number` for sequencing files of the same sample. However, sometimes the information in the column 'sample_alias' can tell you what sample each fastq file actually comes from, avoiding issues from mislabeled samples. If you, like me, use [fastq-dl](https://github.com/rpetit3/fastq-dl) to download files from ENA, then this fix can be done easy with this script, as it allows to rename fastq files from their run accessions to their reported sample aliases using the ena filereport.

	* change_sequence_identifiers.sh :

	Kneaddata v0.12.0 fails to pair forward and reverse reads if sequence identifiers have spaces and don´t end with /1 or /2. Some sequencing machines don't adopt that format so this scripts remove evrything that comes after a white space and changes it for a /1 or /2 using the pair identifier in the file name (either _1 or _2) as a guide 
