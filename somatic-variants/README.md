# Somatic Variant Calling

Benchmarking the somatic calls is still difficult problem due to lack of gold standard Tumor/Normal data with known somatic mutations. Here we are addressing this problem to generate semi-synthetic Tumor/Normal sample using Bamsimulator pipeline which was developed by SomaticSeq team. However, It is not exact resemblance of real tumor data but we are using real sequencing data to spike in somatic mutation which serves as pseudo-tumor. 

Based on data availability, there are three different ways to generate N/T suggested by SomaticSeq. 

- If we have replicates of same normal samples,  we can use one as normal and another as pseudo-tumor with spikedin mutation.
- If we have high coverage sample,  we can split this sample into two and use those as normal and pseudo-tumor.
- If we have normal and tumor sample, spike in known-mutation into tumor sample.

High coverage sample:

* Sample ID : ACC5403A1 (NA12878)
* Sequencing : Targeted Panel Sequencing 
* Size of the panel: 26548 bp
* Coverage: 7471x  
* Bed file: lymphomatic_v2.1_hg19.bed

We followed second method to spike in somatic mutations.

Overview:

- Alignment
- Sorting and Indexing
- MarkDuplicates 
- Run BamSurgeon Workflow
	- Split the Bam file randomly into two  bam files
	- Designated_normal
	- Designated_tumor
	- Generate random sites for snv, indel, sv, and cnv (for given region).
	- Spike in Mutations (SNVs and INDELs)
- Convert the bam file into fastq (To run BALSAMIC)
- VCF - Validation (som.py)


