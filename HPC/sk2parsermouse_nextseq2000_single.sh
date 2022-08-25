#!/bin/bash
#$ -l h_vmem=15G
#$ -l h_rt=99:00:00
#$ -cwd
#$ -M s.klaasen@hubrecht.eu
#$ -m beas
#$ -pe threaded 8

A="S4"

cd /hpc/hub_kops/Sjoerd/rawdataandmapped/run38_KLA7067

gunzip *$A*_R1_001.fastq.gz

mkdir $A-output

/hpc/hub_kops/bin/bwa aln -q 0 -n 0.04 -k 2 -l 200 -t 4 -B 11 /hpc/hub_kops/mm10.fa *$A*_R1_001.fastq > $A-output/$A-R1.sai

/hpc/hub_kops/bin/bwa samse /hpc/hub_kops/mm10.fa $A-output/$A-R1.sai *$A*_R1_001.fastq > $A-output/$A-R1.sam

gzip *$A*_R1_001.fastq

#generates text file from sam file
python /hpc/hub_kops/Sjoerd/nlaparserbed384nextseq2000.py $A-output/$A-R1.sam

cd $A-output

#splits file based on barcode number so that each new file contains all the reads from one cell
awk '{print >> $8; close($8)}' $A-R1.sam_Rnla.out

#removes the cell barcode number, sorts the output, removes all duplicate reads based on chromosome position and UMI and subsequently removes UMI column

/hpc/hub_kops/Sjoerd/rmcelln.sh *
/hpc/hub_kops/Sjoerd/sortcells.sh *
/hpc/hub_kops/Sjoerd/remove.duplicate.reads.sh *
/hpc/hub_kops/Sjoerd/removeumi.sh *

C="run38_$A"

mkdir /hpc/hub_kops/Sjoerd/mappeddata/$C
cp {1..384} /hpc/hub_kops/Sjoerd/mappeddata/$C

cd /hpc/hub_kops/Sjoerd/mappeddata/$C
/hpc/hub_kops/Sjoerd/rename.sh *
