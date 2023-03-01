



## Some notes about copying the files

```
# To download file from filesender directly onto the 
# curl -o filename.xx "https://XXX"
curl -o Hesther-de-Ruiter-sample-1.tar "https://filesender.surf.nl/download.php?XXXX"

# Untar command (note copy+paste of this command sometimes leads to weird results)
tar -xvf *.tar
tar -xvf Hesther-de-Ruiter-sample-1.tar
```

## Notes about the scripts

### Mapping

The main scripts, which are called in sequence, are `sk2_bwamapper_MW.sh` and 
`sk2_parser_MW.sh`. These are modified versions of scripts from the Kops lab.

The script `job_submission_script.sh` shows some examples on how to run these 
script on the server. All these files are in the `./HPC` folder in this repository.

E.g.

```
# Sample from which sequencing results came 28 February 2023
# Sample description: "karyoseq XXX"

sample_name=Sample-Hesther-de-Ruiter-index2_AACJNTKM5_S2
subdir=2023_03/
genome_path=/hpc/hub_oudenaarden/mwehrens/ref/karyoseq/mm10.fa
read_length=101
use_mem=no
nr_cores=16
# mapping with multiple cores:
last_jobid=$(sbatch  --parsable --job-name=karyhoho --time=6-00:00:00 -c ${nr_cores} --mem=15G --export=ALL,sample_name="${sample_name}",read_length="${read_length}",nr_cores="${nr_cores}",use_mem="${use_mem}",genome_path="${genome_path}" /hpc/hub_oudenaarden/mwehrens/scripts/karyoseq_scripts/sk2_bwamapper_MW.sh)
# parsing with 1 core:
sbatch --dependency=afterany:${last_jobid} --job-name=karyho2o --time=6-00:00:00 --mem=15G --export=ALL,sample_name="${sample_name}",read_length="${read_length}",nr_cores="${nr_cores}",use_mem="${use_mem}",genome_path="${genome_path}" /hpc/hub_oudenaarden/mwehrens/scripts/karyoseq_scripts/sk2_parser_MW.sh

```

## Notes about script locations

Currenly, I have run these scripts on the HPC in my personal directory,
and therefor the following paths are defined in the `sk2_bwamapper_MW.sh` and `sk2_parser_MW.sh` scripts

```
datadir=/hpc/hub_oudenaarden/mwehrens/data/karyoseq/fastq/
mappeddatadir=/hpc/hub_oudenaarden/mwehrens/data/karyoseq/mappeddata/

bwadir=/hpc/hub_oudenaarden/mwehrens/bin/miniconda3/bin/ 
scriptdir=/hpc/hub_oudenaarden/mwehrens/scripts/karyoseq_scripts/
```
This needs to be modified if you run the scripts elswhere.

## Notes about genomes

I currently have the mm10 and GRCh38 genome in the 
```
/hpc/hub_oudenaarden/mwehrens/ref/karyoseq
```
directory (.fa files; no gtf is needed as we're not interested in gene annotation).


## Post-processing the mapped data

Scripts pertaining to post-processing can be found in the `./local` directory of this repository.

Download the output folders, and rename the applicable files (only a few barcodes
usually apply to samples) from just the number as filename to contain a prefix
and a .bed extension; e.g. file named "52" to "bulk_52.bed" -- not that you can
select multiple files on a macbook for multiple file renaming.

Create a folder structure like this:
../karyoseq/20221117_expid/library1
../karyoseq/20221117_expid/library2
../karyoseq/20221117_expid/library3
(multiple libraries -- ie different rpx primers -- coming from one experiment).

Where library folders should *only* contain .bed files.

Then run the script which sets parameters (conf-mw_dataset-Hesther202211.R) and
then run the script that loops over the different folders with bed-files
for analysis (AUTOMATION_SCRIPT_BED_FILES.R).
  