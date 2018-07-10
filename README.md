# BALSAMIC_validate

## __version__=0.1.0

## Aim 
A set of tools and data to validate BALSAMIC updates and other relevant pipelines: MIP, Nextflow, and Snakemake based
pipelines or any variant callers.

## Input data description
Samples are simulated data without noise generated from human reference genome hg19. These simulated reads are on fastq
and bam file level. Fastq files can be used to evaluate read aligners, and they are only functional for SNV and probably
some short indels. BAM files, however, are suitable for evaluating SNVs, indels, some handpicked structural variants,
and CNVs.

Samples are divided into WES and WGS data. and right now there is no family or trio level data included.

## Run analysis

1. src/merge_vcf.py Merge output VCF from the pipeline of choice into a single one. This script is just a simple concatenation wrapper. It does NOT right/left align variant and does NOT account for duplicates.

2. src/compare_vcf.py Compares VCF files and generates set of statistics: recall, percision, and F1 score.

3. src/report_vcf.py Generates a simple PDF report from `src/compare_vcf.py` output. It requires pylatex installed.


## Folder structure

WES data:

```
data/WES
├── WES_normal_1.bam
├── WES_normal_1_indel.vcf
├── WES_normal_1_R1.fastq
├── WES_normal_1_R2.fastq
├── WES_normal_1_SNV.vcf
├── WES_tumor_1.bam
├── WES_tumor_1_CNV.vcf
├── WES_tumor_1_indel.vcf
├── WES_tumor_1_R1.fastq
├── WES_tumor_1_R2.fastq
└── WES_tumor_1_SNV.vcf
```

WGS data:

```
data/WGS/
├── WGS_normal_1.bam
├── WGS_normal_1_indel.vcf
├── WGS_normal_1_R1.fastq
├── WGS_normal_1_R2.fastq
├── WGS_normal_1_SNV.vcf
├── WGS_tumor_1.bam
├── WGS_tumor_1_CNV.vcf
├── WGS_tumor_1_indel.vcf
├── WGS_tumor_1_R1.fastq
├── WGS_tumor_1_R2.fastq
└── WGS_tumor_1_SNV.vcf
```


