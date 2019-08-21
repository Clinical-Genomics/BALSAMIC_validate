# BALSAMIC_validation v2.9.1

## Aim 

The goal of this repo is to develop a standard workflow using set of tools to validate BALSAMIC's (Cancer analysis workflow in Clinical Genomics) Somatic, Tumor only and Germline pipelines. 

*Note: This repo is still a work in progress*

## Input data description

Platinum genome (NA12878-WES) has been used as reference data to validate the varinat callers implemented in BALSAMIC. For somatic variants, We used [bamsurgeon workflow](https://github.com/bioinform/somaticseq/tree/master/utilities/dockered_pipelines/bamSimulator) developed by SomaticSeq team to create tumor and normal samples with truth set of variants. This workflow will provide mutations(SNVs, INDELs) spikedin bam file with gold standard vcf file to compare the query vcf.


## Workflows

N/T - data generation:

* This is a singularity based workflow adopted from SomaticSeq bamsimulator pipelines using modified BAMSurgeon.
* `BamSimulator_singleThread.sh` creates semi-simulated tumor-normal pairs out of your input tumor-normal data. The "ground truth" of the somatic mutations will be `synthetic_snvs.vcf` and `synthetic_indels.leftAlign.vcf` in the output directory.
* For multi-thread job (WGS), use `BamSimulator_multiThreads.sh` instead.

Validation:

* Illumina's `Hap.py` tool, suggested by GA4GH, can be used to compare vcf files from BALSAMIC-run and evaluate recall and precision. 
* `som.py` tool is to validate somatic mutations by locations and alleles using bcftools isec.
* For visualization, Seaborn python package has been used to plot `Recall vs Precision`.

## Validation - SNVs and small INDELS
* `germline-variants` -- validation of germline variants using haplotypecaller and strelka-germline \
                       It includes sample details and metrics (true positives, false positives) from hap.py, and scatterplot to show recall and precision for Indel and SNVs called by different variant callers.
                       
* `somatic-variants` -- validation of somatic calls from gatk3-mutect2, VarDict, and Strelka-somatic

