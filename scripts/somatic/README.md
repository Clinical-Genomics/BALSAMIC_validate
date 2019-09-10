# BAMSIMULATOR 

  This pipeline has been written in snakemake to generate truth sets for somatic variant call validation. It requires either high coverage normal sample or two technical replicates of same normal sample to use one as normal and another one as psudo-tumor. To run this workflow, edit the config file with proper file paths and use snakemake with singularity option to start this pipeline.

*Note: This method adopted from [SomaticSeq](https://github.com/bioinform/somaticseq/tree/master/utilities/dockered_pipelines/bamSimulator) repo*

## Requirement

* snakemake
* singularity

Reference files:

* GRCh37 fasta
* Genome index - fai
* Genome dictionary - dict

## Containers

  Pull and save the containers from docker-hub into local.

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

## validation:

  Run the simulated data through balsamic and compare the results with [`som.py`](https://github.com/Illumina/hap.py/blob/master/doc/sompy.md). 

```sh
singularity pull docker://lethalfang/hap.py

singularity exec --bind $reference_dir containers/hap.py.sif /opt/hap.py/bin/som.py \
            benchmark/synthetic_snvs.vcf    # truthset
            testing/sample_vardict.vcf.gz   # query vcf
            -r $reference_dir/genome/human_g1k_v37_decoy.fasta 
            -f benchmark/lymphomatic_v2.1_hg19.bed  
            -o benchmark/somatic_vardict_results 
```
  
