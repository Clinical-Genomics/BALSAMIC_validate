# BALSAMIC_validation _ v2.9.1

## Aim 

The goal of this repo is to develop a standard workflow using set of tools to validate BALSAMIC's (Cancer analysis workflow in Clinical Genomics) Somatic, Tumor only and Germline pipelines. 


## Input data description

Platinum genome (NA12878-WES) has been sequenced to use this as input data for validation using Illumina Novaseq. We used [bamsurgeon workflow](https://github.com/bioinform/somaticseq/tree/master/utilities/dockered_pipelines/bamSimulator) developed by SomaticSeq team to create tumor and normal samples with truth set of variants. This workflow will provide mutations(SNVs, INDELs) spikedin bam file with gold standard vcf file to compare the query vcf.


## Workflows

Data generation:

* This is a singularity based workflow adopted from SomaticSeq bamsimulator pipelines using modified BAMSurgeon.
* `BamSimulator_singleThread.sh` creates semi-simulated tumor-normal pairs out of your input tumor-normal data. The "ground truth" of the somatic mutations will be `synthetic_snvs.vcf` and `synthetic_indels.leftAlign.vcf` in the output directory.
* For multi-thread job (WGS), use BamSimulator_multiThreads.sh instead.

Validation:

* Illumina's `Hap.py` tool can be used to validate the query vcf from BALSAMIC run. It has `som.py` script to compare somatic mutations by locations and alleles using bcftools isec.
* Plots 

Requirements:
	* singularity
	* hap.py
	* sbatch (for HPC)

Note: plots dependencies need to be added

## Folder structure



