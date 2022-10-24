#!/bin/bash
#SBATCH --job-name=radtags_rockfish
#SBATCH --account=merlab
#SBATCH --partition=compute-hugemem
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
## Walltime (days-hours:minutes:seconds format)
#SBATCH --time=15-12:00:00
## Memory per node
#SBATCH --mem=100G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=awray130@uw.edu


##### ENVIRONMENT SETUP ##########
## Specify the directory containing data
DATADIR=/gscratch/scrubbed/awray130/raw #directory with bam files
OUTDIR=/gscratch/scrubbed/awray130/demultiplexed # where to store output files
MYCONDA=/gscratch/merlab/software/miniconda3/etc/profile.d/conda.sh # path to conda installation on our Klone node. Do NOT change this.
MYENV=stacks_env #name of the conda environment containing stacks software. 
## Activate the conda environment:
## start with clean slate
module purge

## This is the filepath to our conda installation on Klone. Source command will allow us to execute commands from a file in the current shell
source $MYCONDA

## activate the conda environment
conda activate $MYENV


#####################PLATE 04##############################################################################################
## Move into the working directory and run script
DATADIR=/gscratch/scrubbed/awray130/raw/plate04
BARCODES=/gscratch/scrubbed/awray130/barcodes
cd $DATADIR


### Separates raw sequencing files into individual IDs based on matching barcodes

process_radtags \
-p $DATADIR \
-P \
-o $OUTDIR \
-b $BARCODES/Barcodes_Plate04.txt \
--inline_index \
-i gzfastq \
-y fastq \
-E phred33 \
--bestrad \
-e sbfI \
-q \
--filter_illumina \
-c \
-t 104 \
--adapter_1 AGATCGGAAGAGCACACGTCTGAACTCCAGTCA \
--adapter_2 AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT \
-r \
--barcode_dist_1 1 \
--barcode_dist_2 1 \

##################PLATE 05###########################
DATADIR=/gscratch/scrubbed/awray130/raw/plate05
BARCODES=/gscratch/scrubbed/awray130/barcodes
cd $DATADIR


### Separates raw sequencing files into individual IDs based on matching barcodes

process_radtags \
-p $DATADIR \
-P \
-o $OUTDIR \
-b $BARCODES/Barcodes_Plate05.txt \
--inline_index \
-i gzfastq \
-y fastq \
-E phred33 \
--bestrad \
-e sbfI \
-q \
--filter_illumina \
-c \
-t 104 \
--adapter_1 AGATCGGAAGAGCACACGTCTGAACTCCAGTCA \
--adapter_2 AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT \
-r \
--barcode_dist_1 1 \
--barcode_dist_2 1 \

####################PLATE 06#########################
DATADIR=/gscratch/scrubbed/awray130/raw/plate06
BARCODES=/gscratch/scrubbed/awray130/barcodes
cd $DATADIR


### Separates raw sequencing files into individual IDs based on matching barcodes

process_radtags \
-p $DATADIR \
-P \
-o $OUTDIR \
-b $BARCODES/Barcodes_Plate06.txt \
--inline_index \
-i gzfastq \
-y fastq \
-E phred33 \
--bestrad \
-e sbfI \
-q \
--filter_illumina \
-c \
-t 104 \
--adapter_1 AGATCGGAAGAGCACACGTCTGAACTCCAGTCA \
--adapter_2 AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT \
-r \
--barcode_dist_1 1 \
--barcode_dist_2 1 \

## deactivate the conda environment
conda deactivate
