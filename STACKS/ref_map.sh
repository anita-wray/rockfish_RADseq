#!/bin/bash
#SBATCH --job-name=rockfish_refmap
#SBATCH --account=merlab
#SBATCH --partition=compute-hugemem
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
## Walltime (days-hours:minutes:seconds format)
#SBATCH --time=2-12:00:00
## Memory per node
#SBATCH --mem=100G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=awray130@uw.edu


##### ENVIRONMENT SETUP ##########
MYCONDA=/gscratch/merlab/software/miniconda3/etc/profile.d/conda.sh # path to conda installation on our Klone node. Do NOT change this.
MYENV=stacks_env #name of the conda environment containing stacks software. 
## Activate the conda environment:
## start with clean slate
module purge

## This is the filepath to our conda installation on Klone. Source command will allow us to execute commands from a file in the current shell
source $MYCONDA

## activate the conda environment
conda activate $MYENV


#### BLACK ROCKFISH################
DATADIR=/gscratch/scrubbed/awray130/bam/sortedbam/black #directory with bam files
OUTDIR=/gscratch/scrubbed/awray130/refmap/black # where to store output files
POPMAP=/gscratch/scrubbed/awray130/popmap/black_popmap.txt

## Move into the working directory and run script
cd $DATADIR

ref_map.pl -T ${SLURM_JOB_CPUS_PER_NODE} --samples $DATADIR  --popmap $POPMAP -o $OUTDIR -X "gstacks: --min-mapq 40" -X "populations: --vcf --ordered-export" 

#### BROWN ROCKFISH################
DATADIR=/gscratch/scrubbed/awray130/bam/sortedbam/brown #directory with bam files
OUTDIR=/gscratch/scrubbed/awray130/refmap/brown # where to store output files
POPMAP=/gscratch/scrubbed/awray130/popmap/brown_popmap.txt

## Move into the working directory and run script
cd $DATADIR

ref_map.pl -T ${SLURM_JOB_CPUS_PER_NODE} --samples $DATADIR  --popmap $POPMAP -o $OUTDIR -X "gstacks: --min-mapq 42" -X "populations: --vcf --ordered-export" 


#### COPPER ROCKFISH################
DATADIR=/gscratch/scrubbed/awray130/bam/sortedbam/copper #directory with bam files
OUTDIR=/gscratch/scrubbed/awray130/refmap/copper # where to store output files
POPMAP=/gscratch/scrubbed/awray130/popmap/copper_popmap.txt

## Move into the working directory and run script
cd $DATADIR

ref_map.pl -T ${SLURM_JOB_CPUS_PER_NODE} --samples $DATADIR  --popmap $POPMAP -o $OUTDIR -X "gstacks: --min-mapq 42" -X "populations: --vcf --ordered-export" 


#### GREENSTRIPED ROCKFISH################
DATADIR=/gscratch/scrubbed/awray130/bam/sortedbam/greenstriped #directory with bam files
OUTDIR=/gscratch/scrubbed/awray130/refmap/greenstriped # where to store output files
POPMAP=/gscratch/scrubbed/awray130/popmap/greenstriped_popmap.txt

## Move into the working directory and run script
cd $DATADIR

ref_map.pl -T ${SLURM_JOB_CPUS_PER_NODE} --samples $DATADIR  --popmap $POPMAP -o $OUTDIR -X "gstacks: --min-mapq 42" -X "populations: --vcf --ordered-export" 


#### QUILLBACK ROCKFISH################
DATADIR=/gscratch/scrubbed/awray130/bam/sortedbam/quillback #directory with bam files
OUTDIR=/gscratch/scrubbed/awray130/refmap/quillback # where to store output files
POPMAP=/gscratch/scrubbed/awray130/popmap/quillback_popmap.txt

## Move into the working directory and run script
cd $DATADIR

ref_map.pl -T ${SLURM_JOB_CPUS_PER_NODE} --samples $DATADIR  --popmap $POPMAP -o $OUTDIR -X "gstacks: --min-mapq 42" -X "populations: --vcf --ordered-export" 


#### REDSTRIPE ROCKFISH################
DATADIR=/gscratch/scrubbed/awray130/bam/sortedbam/redstripe #directory with bam files
OUTDIR=/gscratch/scrubbed/awray130/refmap/redstripe # where to store output files
POPMAP=/gscratch/scrubbed/awray130/popmap/redstripe_popmap.txt

## Move into the working directory and run script
cd $DATADIR

ref_map.pl -T ${SLURM_JOB_CPUS_PER_NODE} --samples $DATADIR  --popmap $POPMAP -o $OUTDIR -X "gstacks: --min-mapq 42" -X "populations: --vcf --ordered-export" 


#### YELLOWTAIL ROCKFISH################
DATADIR=/gscratch/scrubbed/awray130/bam/sortedbam/yellowtail #directory with bam files
OUTDIR=/gscratch/scrubbed/awray130/refmap/yellowtail # where to store output files
POPMAP=/gscratch/scrubbed/awray130/popmap/yellowtail_popmap.txt

## Move into the working directory and run script
cd $DATADIR

ref_map.pl -T ${SLURM_JOB_CPUS_PER_NODE} --samples $DATADIR  --popmap $POPMAP -o $OUTDIR -X "gstacks: --min-mapq 42" -X "populations: --vcf --ordered-export" 


## deactivate the conda environment
conda deactivate

#### PUGET SOUND ROCKFISH################
DATADIR=/gscratch/scrubbed/awray130/bam/sortedbam/pugetsound #directory with bam files
OUTDIR=/gscratch/scrubbed/awray130/refmap/pugetsound # where to store output files
POPMAP=/gscratch/scrubbed/awray130/popmap/pugetsound_popmap.txt

## Move into the working directory and run script
cd $DATADIR

ref_map.pl -T ${SLURM_JOB_CPUS_PER_NODE} --samples $DATADIR  --popmap $POPMAP -o $OUTDIR -X "gstacks: --min-mapq 40" -X "populations: --vcf --ordered-export" 
