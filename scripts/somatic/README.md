# BAMSIMULATOR 

This pipeline has been written in snakemake to generate truth sets for somatic variant call validation. 

Note: this workflow is motivation from SomaticSeq bamsimulator pipeline

## Requirement

* snakemake
* singularity

## Usage

```sh
snakemake --use-singularity --singularity-args "-H $HOME_DIR"
```