#!/bin/bash
#SBATCH --job-name=PCRduplicates_rockfish
#SBATCH --account=merlab
#SBATCH --partition=compute-hugemem
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
## Walltime (days-hours:minutes:seconds format)
#SBATCH --time=9:00:00
## Memory per node
#SBATCH --mem=100G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=awray130@uw.edu


##### ENVIRONMENT SETUP ##################################
## Specify the directory containing data
DATADIR=/gscratch/scrubbed/awray130/demultiplexed #directory with bam files
OUTDIR=/gscratch/scrubbed/awray130/clone_filter # where to store output files
MYCONDA=/gscratch/merlab/software/miniconda3/etc/profile.d/conda.sh # path to conda installation on our Klone node. Do NOT change this.
MYENV=stacks_env #name of the conda environment containing stacks software. 

## Activate the conda environment: #######################
## start with clean slate
module purge

## This is the filepath to our conda installation on Klone. Source command will allow us to execute commands from a file in the current shell
source $MYCONDA

## activate the conda environment
conda activate $MYENV

############Run clone_filter #############################
cd $DATADIR

IND_ID=$(cat /gscratch/scrubbed/awray130/IDs/barcodes_combined.txt| cut -f3)

for i in ${IND_ID};
do
echo i
clone_filter \
-1 $DATADIR/${i}.1.fq \
-2 $DATADIR/${i}.2.fq \
-o $OUTDIR \
&>> $OUTDIR/output.txt

done

mv *.1.1.fq ../clone_filter
mv *.2.2.fq ../clone_filter

for i in ${IND_ID};
do
  cat /gscratch/scrubbed/awray130/clone_filter/${i}.1.1.fq > /gscratch/scrubbed/awray130/clone_filter/${i}.1.fq
  cat /gscratch/scrubbed/awray130/clone_filter/${i}.2.2.fq > /gscratch/scrubbed/awray130/clone_filter/${i}.2.fq
  
  done

## deactivate the conda environment
conda deactivate


