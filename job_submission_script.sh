
################################################################################

# Script with commands that (have) run jobs;

################################################################################

# Notes

# To untar:
# tar -xvf *

# for playing around (or untarring stuff):
# srun --nodes=1 -c 1 --mem=64G --time=1:00:00 --pty bash -i

# To check out files, e.g. read lengths;
# zcat Hesther-de-Ruiter-Sample1-myzap_AAC3KV5M5_S1_L001_R1_001.fastq.gz | head

################################################################################

# Not sure why this is here..
# sbatch /hpc/hub_oudenaarden/mwehrens/scripts/karyoseq_scripts/sk2parserhuman_nextseq2000_single.sh

################################################################################

# Sample from which sequencing results came 28 February 2023
# Sample description: "karyoseq mES LMNA Q493X"

sample_name=Sample-Hesther-de-Ruiter-index2_AACJNTKM5_S2
subdir=2023_03/
genomepath=/hpc/hub_oudenaarden/mwehrens/ref/karyoseq/mm10.fa
read_length=101
use_mem=no
nr_cores=16
# mapping with multiple cores:
last_jobid=$(sbatch  --parsable --job-name=karyhoho --time=6-00:00:00 -c ${nr_cores} --mem=15G --export=ALL,sample_name="${sample_name}",read_length="${read_length}",nr_cores="${nr_cores}",use_mem="${use_mem}",genomepath="${genomepath}",subdir="${subdir}" /hpc/hub_oudenaarden/mwehrens/scripts/karyoseq_scripts/sk2_bwamapper_MW.sh)
# parsing with 1 core:
sbatch --dependency=afterany:${last_jobid} --job-name=karyho2o --time=6-00:00:00 --mem=15G --export=ALL,sample_name="${sample_name}",read_length="${read_length}",nr_cores="${nr_cores}",use_mem="${use_mem}",genomepath="${genomepath}",subdir="${subdir}" /hpc/hub_oudenaarden/mwehrens/scripts/karyoseq_scripts/sk2_parser_MW.sh
# sbatch --job-name=karyho2o --time=6-00:00:00 --mem=15G --export=ALL,sample_name="${sample_name}",read_length="${read_length}",nr_cores="${nr_cores}",use_mem="${use_mem}",genomepath="${genomepath}",subdir="${subdir}" /hpc/hub_oudenaarden/mwehrens/scripts/karyoseq_scripts/sk2_parser_MW.sh

# sbatch --export=ALL,sample_name="${sample_name}",read_length="${read_length}",nr_cores="${nr_cores}",use_mem="${use_mem}",genomepath="${genomepath}",subdir="${subdir}" ./testscript.sh

################################################################################

# Note: I later added the "genomepath" option; the code below
# didn't have that option, I added it here, but code was originally run
# differently (though shouldn't matter).

genomepath=/hpc/hub_oudenaarden/mwehrens/ref/karyoseq/GRCh38.p10.genome.clean.fa
sample_name=Hesther-de-Ruiter-sample-1
read_length=150
use_mem=no
nr_cores=16
# mapping with multiple cores:
last_jobid=$(sbatch  --parsable --job-name=karyhoho --time=6-00:00:00 -c ${nr_cores} --mem=15G --export=ALL,sample_name="${sample_name}",read_length="${read_length}",nr_cores="${nr_cores}",use_mem="${use_mem}",genomepath="${genomepath}" /hpc/hub_oudenaarden/mwehrens/scripts/karyoseq_scripts/sk2_bwamapper_MW.sh)
# parsing with 1 core:
sbatch --dependency=afterany:${last_jobid} --job-name=karyho2o --time=6-00:00:00 --mem=15G --export=ALL,sample_name="${sample_name}",read_length="${read_length}",nr_cores="${nr_cores}",use_mem="${use_mem}",genomepath="${genomepath}" /hpc/hub_oudenaarden/mwehrens/scripts/karyoseq_scripts/sk2_parser_MW.sh

sample_name=Hesther-de-Ruiter-sample-2
read_length=150
use_mem=no
nr_cores=16
last_jobid=$(sbatch  --parsable --job-name=karyhoho --time=6-00:00:00 -c ${nr_cores} --mem=15G --export=ALL,sample_name="${sample_name}",read_length="${read_length}",nr_cores="${nr_cores}",use_mem="${use_mem}" /hpc/hub_oudenaarden/mwehrens/scripts/karyoseq_scripts/sk2_bwamapper_MW.sh)
# parsing with 1 core:
sbatch --dependency=afterany:${last_jobid} --job-name=karyho2o --time=6-00:00:00 --mem=15G --export=ALL,sample_name="${sample_name}",read_length="${read_length}",nr_cores="${nr_cores}",use_mem="${use_mem}" /hpc/hub_oudenaarden/mwehrens/scripts/karyoseq_scripts/sk2_parser_MW.sh




# Previously, I didn't use multiple cores

sample_name=mw2_Hesther-de-Ruiter-sample-1
read_length=150
use_mem=no
nr_cores=16
last_jobid=$(sbatch  --parsable --job-name=karyhoho --time=6-00:00:00 -c ${nr_cores} --mem=15G --export=ALL,sample_name="${sample_name}",read_length="${read_length}",nr_cores="${nr_cores}",use_mem="${use_mem}" /hpc/hub_oudenaarden/mwehrens/scripts/karyoseq_scripts/sk2_bwamapper_MW.sh)
# parsing with 1 core:
sbatch --dependency=afterany:${last_jobid} --job-name=karyho2o --time=6-00:00:00 --mem=15G --export=ALL,sample_name="${sample_name}",read_length="${read_length}",nr_cores="${nr_cores}",use_mem="${use_mem}" /hpc/hub_oudenaarden/mwehrens/scripts/karyoseq_scripts/sk2_parser_MW.sh
# sbatch --job-name=karyho2o --time=6-00:00:00 --mem=15G --export=ALL,sample_name="${sample_name}",read_length="${read_length}",nr_cores="${nr_cores}",use_mem="${use_mem}" /hpc/hub_oudenaarden/mwehrens/scripts/karyoseq_scripts/sk2_parser_MW.sh

sample_name=mw2_Hesther-de-Ruiter-sample-2
read_length=150
use_mem=no
nr_cores=16
last_jobid=$(sbatch  --parsable --job-name=karyhoho --time=6-00:00:00 -c ${nr_cores} --mem=15G --export=ALL,sample_name="${sample_name}",read_length="${read_length}",nr_cores="${nr_cores}",use_mem="${use_mem}" /hpc/hub_oudenaarden/mwehrens/scripts/karyoseq_scripts/sk2_bwamapper_MW.sh)
# parsing with 1 core:
sbatch --dependency=afterany:${last_jobid} --job-name=karyho2o --time=6-00:00:00 --mem=15G --export=ALL,sample_name="${sample_name}",read_length="${read_length}",nr_cores="${nr_cores}",use_mem="${use_mem}" /hpc/hub_oudenaarden/mwehrens/scripts/karyoseq_scripts/sk2_parser_MW.sh
# sbatch --job-name=karyho2o --time=6-00:00:00 --mem=15G --export=ALL,sample_name="${sample_name}",read_length="${read_length}",nr_cores="${nr_cores}",use_mem="${use_mem}" /hpc/hub_oudenaarden/mwehrens/scripts/karyoseq_scripts/sk2_parser_MW.sh


################################################################################


# Samples Hesther 2022-11
subdir=2022_11
sample_name=Hesther-de-Ruiter-Sample1-myzap
read_length=101 # the length of the reads is 101, but not sure whether i should do -1 for this nr
use_mem=no
nr_cores=16
last_jobid=$(sbatch  --parsable --job-name=karyhoho --time=6-00:00:00 -c ${nr_cores} --mem=15G --export=ALL,sample_name="${sample_name}",read_length="${read_length}",subdir="${subdir}",nr_cores="${nr_cores}",use_mem="${use_mem}" /hpc/hub_oudenaarden/mwehrens/scripts/karyoseq_scripts/sk2_bwamapper_MW.sh)
# parsing with 1 core:
sbatch --dependency=afterany:${last_jobid} --job-name=karyho2o --time=6-00:00:00 --mem=15G --export=ALL,sample_name="${sample_name}",read_length="${read_length}",subdir="${subdir}",nr_cores="${nr_cores}",use_mem="${use_mem}" /hpc/hub_oudenaarden/mwehrens/scripts/karyoseq_scripts/sk2_parser_MW.sh
# sbatch --job-name=karyho2o --time=6-00:00:00 --mem=15G --export=ALL,sample_name="${sample_name}",read_length="${read_length}",nr_cores="${nr_cores}",use_mem="${use_mem}" /hpc/hub_oudenaarden/mwehrens/scripts/karyoseq_scripts/sk2_parser_MW.sh


# Samples Hesther 2022-11
subdir=2022_11
sample_name=Hesther-de-Ruiter-Sample2-neongreen
read_length=101 # the length of the reads is 101, but not sure whether i should do -1 for this nr
use_mem=no
nr_cores=16
last_jobid=$(sbatch  --parsable --job-name=karyhoho --time=6-00:00:00 -c ${nr_cores} --mem=15G --export=ALL,sample_name="${sample_name}",read_length="${read_length}",subdir="${subdir}",nr_cores="${nr_cores}",use_mem="${use_mem}" /hpc/hub_oudenaarden/mwehrens/scripts/karyoseq_scripts/sk2_bwamapper_MW.sh)
# parsing with 1 core:
sbatch --dependency=afterany:${last_jobid} --job-name=karyho2o --time=6-00:00:00 --mem=15G --export=ALL,sample_name="${sample_name}",read_length="${read_length}",subdir="${subdir}",nr_cores="${nr_cores}",use_mem="${use_mem}" /hpc/hub_oudenaarden/mwehrens/scripts/karyoseq_scripts/sk2_parser_MW.sh
# sbatch --job-name=karyho2o --time=6-00:00:00 --mem=15G --export=ALL,sample_name="${sample_name}",read_length="${read_length}",nr_cores="${nr_cores}",use_mem="${use_mem}" /hpc/hub_oudenaarden/mwehrens/scripts/karyoseq_scripts/sk2_parser_MW.sh


# Samples Hesther 2022-11
subdir=2022_11
sample_name=Hesther-de-Ruiter-Sample3-rra60
read_length=101 # the length of the reads is 101, but not sure whether i should do -1 for this nr
use_mem=no
nr_cores=16
last_jobid=$(sbatch  --parsable --job-name=karyhoho --time=6-00:00:00 -c ${nr_cores} --mem=15G --export=ALL,sample_name="${sample_name}",read_length="${read_length}",subdir="${subdir}",nr_cores="${nr_cores}",use_mem="${use_mem}" /hpc/hub_oudenaarden/mwehrens/scripts/karyoseq_scripts/sk2_bwamapper_MW.sh)
# parsing with 1 core:
sbatch --dependency=afterany:${last_jobid} --job-name=karyho2o --time=6-00:00:00 --mem=15G --export=ALL,sample_name="${sample_name}",read_length="${read_length}",subdir="${subdir}",nr_cores="${nr_cores}",use_mem="${use_mem}" /hpc/hub_oudenaarden/mwehrens/scripts/karyoseq_scripts/sk2_parser_MW.sh
# sbatch --job-name=karyho2o --time=6-00:00:00 --mem=15G --export=ALL,sample_name="${sample_name}",read_length="${read_length}",nr_cores="${nr_cores}",use_mem="${use_mem}" /hpc/hub_oudenaarden/mwehrens/scripts/karyoseq_scripts/sk2_parser_MW.sh










