#!/bin/bash

A="S100"
cd /hpc/hub_kops/rawdataandmapped/run18_mouse_nannette

gunzip *$A*_R1_001.fastq.gz

mkdir $A-barcode_split

cat *$A*_R1_001.fastq > $A-output/$A-R1.fastq

python -m barcode_splitter --bcfile /hpc/hub_kops/NLAIII384barcodes+columnnumber.txt *$A*_R1_001.fastq --idxread 1 --suffix .fastq

gzip *$A*_R1_001.fastq.gz

