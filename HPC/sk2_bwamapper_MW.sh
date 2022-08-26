#!/bin/bash
#$ -l h_vmem=15G
#$ -l h_rt=99:00:00
#$ -cwd
#$ -M m.wehrens@hubrecht.eu
#$ -m beas
#$ -pe threaded 8

# input parameters for calling the script
# note: usually, you'd use $1, $2, but the sbatch commands doesn't handle that well, 
# so I use the --export=ALL,... option.
A=$sample_name #"Hesther-de-Ruiter-sample-2" # sample identification
READLENGTH=$read_length
nr_cores=$nr_cores
# use_mem=$use_mem

echo "running with $nr_cores cores"

# For a test-run, use:
#
# file=XXX
# head -n 1000 $file > head_$file
# A=head_${file}

datadir=/hpc/hub_oudenaarden/mwehrens/data/karyoseq/fastq/
mappeddatadir=/hpc/hub_oudenaarden/mwehrens/data/karyoseq/mappeddata/

bwadir=/hpc/hub_oudenaarden/mwehrens/bin/miniconda3/bin/ 
genomedir=/hpc/hub_oudenaarden/mwehrens/ref/karyoseq/
scriptdir=/hpc/hub_oudenaarden/mwehrens/scripts/karyoseq_scripts/

#cd /hpc/hub_kops/Sjoerd/rawdataandmapped/run47_core
cd $datadir

gunzip *$A*_R1_001.fastq.gz

mkdir $A-output

# Mapping by Sjoerd
${bwadir}bwa aln -q 0 -n 0.04 -k 1 -l 30 -t $nr_cores -B 11 ${genomedir}GRCh38.p10.genome.clean.fa *$A*_R1_001.fastq > $A-output/$A-R1.sai
${bwadir}bwa samse ${genomedir}GRCh38.p10.genome.clean.fa $A-output/$A-R1.sai *$A*_R1_001.fastq > $A-output/$A-R1.sam
  # previous values of parameters that I changed
  # l=200
  # k=2
  #
  # q = Parameter for read trimming. (not available in bwa mem)
  # n = Maximum edit distance (not available in bwa mem)
  # k = Maximum edit distance in the seed (note that for bwa mem, k gives the minimum seed length.)
  # l = seed length; note that 200 is pretty high (>query; makes long read slow pro'lly), 25-30 'typical'
  # t = number of threads (!!) [originally set at 4]
  # B = Length of barcode starting from the 5’-end.


# Wanted to implement bwa mem, but that doesn't allow for the "B" option;
# would be neater, but involves re-writing the workflow as trimming needs
# to be done before and barcodes need to be saves (possible but work)
# 
#if [[ $use_mem == "yes" ]]; then
#  
#  # Option added by martijn (note: use multiple cores!)
#  echo "using bwa mem"
#  ${bwadir}/bwa mem -t $nr_cores ${genomedir}GRCh38.p10.genome.clean.fa *$A*_R1_001.fastq > $A-output/$A-R1.sam
#  # in other script I use: -h 15 
#  
#else
#fi  


gzip *$A*_R1_001.fastq

# moved parsing to 2nd file to allow throttlings down # of cores

