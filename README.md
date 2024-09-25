## Bash scripts dump

These are scripts I used for different goals/analyses that are part of almost every microbiome project.

While these scripts may be useful for other microbiome scientists, the repository wasn't created for other people to use the scripts here available. Therefore, if you do so, proceed with caution.

## Small description for the scripts per folder
* **fastq_prep**
	* <ins>aggregate_lanes.sh</ins> : when same sample is sequenced in different lanes, we want to aggregate all those files into just one. This script does that. This appends lane after lane. If other more sophisticated approaches are required, then consider use other scripts.
	* <ins>rename_teagasc_fastqfiles.sh</ins> : change the identifier of forward and reverse reads from `*_R{1,2}_001.fastq.gz` to more standard `_{1,2}.fastq.gz`
