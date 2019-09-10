# Germline validation:
  The purpose of this workflow is to automate the downloading germline data and making it ready for the validation. Pipeline has been written in snakemake-workflow language. 

## Requirement:
* Snakmake
* Picard
  
  Conda can be used as package management system.

## Data:
* NA12878 - NIST project (Trimmed fastq files) 
* nexterarapidcapture - bed file
* High confidence vcf file
* Chain file - hg19_to_GRCh37 (to remove chr prefix)

 ## Usage:
  Update the config file with proper file paths and Run this workflow.
 
 ```sh
 # change directory
 cd BALSAMIC_validate/scripts/germline/
 
 # to create conda env 
 conda env create -f conda.yaml
 
 # to run 
 snakemake 
 ```

# Validation:

Run the BALSAMIC through this data and get the results (vcf) for validation. This can be done by illumina's [`hap.py`](https://github.com/Illumina/hap.py) tool. Complex variant comparison, preprocessing and variant counting will be handled by hap.py, xcmp is the default comparison engine. RTG-eval is the alternative comparison method.

Requirement:
* singularity

commands:

```sh
# Pull the Hap.py container
singularity pull docker://lethalfang/hap.py

# validation
singularity exec --bind $reference_dir containers/hap.py.sif /opt/hap.py/bin/hap.py truthset/project.NIST.hc.snps.indels.vcf benchmark/analysis/vep/sample.haplotypecaller.vcf  -r $reference_dir/genome/human_g1k_v37_decoy.fasta -o benchmark/mutect_metrics --preprocess-truth
```

The output stats will be stored in csv file which can be used to plots.
 
 
