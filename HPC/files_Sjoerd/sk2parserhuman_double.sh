#!/bin/bash
#$ -l h_vmem=15G
#$ -l h_rt=99:00:00
#$ -cwd
#$ -M s.klaasen@hubrecht.eu
#$ -M n.lansu@hubrecht.eu
#$ -m beas
#$ -pe threaded 8

A="_S1"
B="_S2"
cd /hpc/hub_kops/rawdataandmapped/run14tumor_BJ

gunzip *$A*_R1_001.fastq.gz
gunzip *$B*_R1_001.fastq.gz

mkdir $A-output

cat *$A*_R1_001.fastq *$B*_R1_001.fastq > $A-output/$A-R1.fastq

bwa aln -q 0 -n 0.04 -k 2 -l 200 -t 4 -B 11 /hpc/hub_kops/GRCh38.p10.genome.clean.fa $A-output/$A-R1.fastq > $A-output/$A-R1.sai

gzip *$A*_R1_001.fastq
gzip *$B*_R1_001.fastq

bwa samse /hpc/hub_kops/GRCh38.p10.genome.clean.fa $A-output/$A-R1.sai $A-output/$A-R1.fastq > $A-output/$A-R1.sam

generates text file from sam file
python /hpc/hub_kops/nlaparserbed384.py $A-output/$A-R1.sam

cd $A-output
 
splits file based on barcode number so that each new file contains all the reads from one cell
awk '{print >> $8; close($8)}' $A-R1.sam_Rnla.out

removes the cell barcode number, sorts the output, removes all duplicate reads based on chromosome position and UMI and subsequently removes UMI column

/hpc/hub_kops/rmcelln.sh *
/hpc/hub_kops/sortcells.sh *
/hpc/hub_kops/remove.duplicate.reads.sh *
/hpc/hub_kops/removeumi.sh *

C="run14_monasj"

mkdir /hpc/hub_kops/mappeddata1/$C
cp {1..384} /hpc/hub_kops/mappeddata1/$C
