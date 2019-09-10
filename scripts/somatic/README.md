# BAMSIMULATOR 

  This pipeline has been written in snakemake to generate truth sets for somatic variant call validation. It requires either high coverage normal sample or two technical replicates of same normal sample to use one as normal and another one as psudo-tumor. To run this workflow, edit the config file with proper file paths and use snakemake with singularity option to start this pipeline.

## Requirement

* snakemake
* singularity

Reference files:

* GRCh37 fasta
* Genome index - fai
* Genome dictionary - dict

## Containers

  Pull and save the container from docker hub into local.

```sh
singularity pull docker://lethalfang/somaticseq
singularity pull docker://lethalfang/bamsurgeon
```

## Usage
  
  To run the pipeline, change the directory to `BALSAMIC_validate/scripts/somatic/bamsimulator` and modify the config file with appropriate file paths. Run this command.

```sh
cd BALSAMIC_validate/scripts/somatic/bamsimulator

snakemake --use-singularity --singularity-args "-H $HOME_DIR"
```
