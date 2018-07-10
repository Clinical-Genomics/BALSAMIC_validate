# vim: syntax=python tabstop=4 expandtab
# coding: utf-8

__author__ = "Hassan Foroughi Asl"

rule all:
  input:
    "../data/sim_fastq/ref_data/db/genome.fa",
    expand("../data/sim_fastq/ref_data/samples/normal.{suffix}",suffix=["bwa.read2.fastq", "bwa.read1.fastq"]),
    expand("../data/sim_fastq/ref_data/samples/tumor.{suffix}",suffix=["bwa.read2.fastq", "bwa.read1.fastq"]),
  
rule prepare_genome:
  input:
    fa="/mnt/hds/proj/bioinfo/BALSAMIC/references/GRCh37/GRCh37_homo_sapiens_-d5-.fasta"
  output:
    "../data/sim_fastq/ref_data/db/genome.fa"
  shell:
    "samtools faidx {input.fa} 22:15000000-16500000 21:15000000-16500000 "
    "| sed 's/>22:15000000-16500000/>22/g' | sed 's/>21:15000000-16500000/>21/g'> {output}; "
    "samtools faidx {output}; "

rule simulate_reads:
  input:
    fa="../data/sim_fastq/ref_data/db/genome.fa"
  output:
    expand("../data/sim_fastq/ref_data/samples/normal.{suffix}",suffix=["bwa.read2.fastq", "bwa.read1.fastq"]),
    expand("../data/sim_fastq/ref_data/samples/tumor.{suffix}",suffix=["bwa.read2.fastq", "bwa.read1.fastq"]),
  params:
    Coverage="10",
    MutationRate="0.1",
    readLength="100",
    outputdir="../data/sim_fastq/ref_data/samples/"
  shell:
    "dwgsim -N 20000 -e 0.02 -E 0.02 -d 500 "
    "-s 50 -C {params.Coverage} -1 {params.readLength} -2 {params.readLength} "
    "-r 0 -F 0 -R 0 -X 0.3 "
    "-I 1 -y 0 -n 0 -c 0 -S 2 -z 123456 "
    "{input} normal; mv normal* {params.outputdir}; "
    "dwgsim -N 20000 -e 0.02 -E 0.02 -d 500 "
    "-s 50 -C {params.Coverage} -1 {params.readLength} -2 {params.readLength} "
    "-r {params.MutationRate} -F 0.5 -R 0.1 -X 0.3 "
    "-I 1 -y 0 -n 0 -c 0 -S 2 -z 123456 "
    "{input} tumor; mv tumor* {params.outputdir}; "
