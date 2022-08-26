#!/bin/bash


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






#generates text file from sam file
python ${scriptdir}nlaparserbed384nextseq2000.py $A-output/$A-R1.sam ${scriptdir}NLAIII384barcodes.txt $READLENGTH
  # nlaparserbed384nextseq2000.py <samfile> <barcodefile> <readlength>

cd $A-output

#splits file based on barcode number so that each new file contains all the reads from one cell (or sample)
awk '{print >> $8; close($8)}' $A-R1.sam_Rnla.out

#removes the cell barcode number, sorts the output, removes all duplicate reads based on chromosome position and UMI and subsequently removes UMI column

${scriptdir}rmcelln.sh *
${scriptdir}sortcells.sh *
${scriptdir}remove.duplicate.reads.sh *
${scriptdir}removeumi.sh *

C="run43_$A"

mkdir -p ${mappeddatadir}$C
cp {1..384} ${mappeddatadir}$C

cd ${mappeddatadir}$C
${scriptdir}rename.sh *