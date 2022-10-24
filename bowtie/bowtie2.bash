#!/bin/bash
#SBATCH --job-name=rockfish_bowtie2
#SBATCH --account=merlab
#SBATCH --partition=compute-hugemem
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
## Walltime (days-hours:minutes:seconds format)
#SBATCH --time=11-12:00:00
## Memory per node
#SBATCH --mem=200G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=awray130@uw.edu

##### ENVIRONMENT SETUP ##########
DATADIR=/gscratch/scrubbed/awray130/clone_filter # The directory containing all of your fastq files
MYLANEID=LaneAll # The sequencing id of the lane (you can set this to whatever value you want)
GENOMEDIR=/gscratch/scrubbed/awray130/genome #The directory containing the reference genome
GENOME_PREFIX=GCF_015220745.1_fSebUmb1.pri_genomic #prefix of .bt2 files made by bowtie2 (the name of the genome, without the suffixes)
SUFFIX1=.1.fq  # Suffix to the fastq files -  The forward reads with paired-end data.
SUFFIX2=.2.fq  # Suffix to the fastq files - The reverse reads with paired-end data.
OUTDIR=/gscratch/scrubbed/awray130/sam # where to store output files

##############################################################################
## 1. Index the rockfish genome so bowtie2 can use it
#bowtie2-build -f $GENOMEDIR'/'$GENOME_PREFIX'.fna' $GENOMEDIR'/'$GENOME_PREFIX

## 2.  Make directory for output files
#mkdir $OUTDIR

## 3. Move into the directory containing the fastq files
cd $DATADIR 

## 4. Run bowtie over all samples in the sample list

for MYFILE in $DATADIR'/'*$SUFFIX1
do
	#echo $MYFILE
	MYBASE=`basename --suffix=$SUFFIX1 $MYFILE`
	#echo ${MYBASE}
	bowtie2 -x /gscratch/scrubbed/awray130/genome'/'$GENOME_PREFIX\
	--phred33 -q \
	-1 ${MYBASE}$SUFFIX1 \
	-2 ${MYBASE}$SUFFIX2 \
	-S ${MYBASE}.sam \
	--very-sensitive \
	--minins 0 --maxins 1500 --fr \
	--threads ${SLURM_JOB_CPUS_PER_NODE} \
	--rg-id ${MYBASE} --rg SM:${MYBASE} --rg LB:${MYBASE} --rg PU:${MYLANEID} --rg PL:ILLUMINA
done

# Move all of the sam files to the output directory
mv *'.sam' $OUTDIR
