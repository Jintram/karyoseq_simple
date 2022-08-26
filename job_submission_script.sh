


sbatch /hpc/hub_oudenaarden/mwehrens/scripts/karyoseq_scripts/sk2parserhuman_nextseq2000_single.sh



sample_name=Hesther-de-Ruiter-sample-1
read_length=150
use_mem=no
nr_cores=16
sbatch --job-name=karyhoho --time=6-00:00:00 -c ${nr_cores} --mem=15G --export=ALL,sample_name="${sample_name}",read_length="${read_length}",nr_cores="${nr_cores}",use_mem="${use_mem}" /hpc/hub_oudenaarden/mwehrens/scripts/karyoseq_scripts/sk2parserhuman_nextseq2000_single.sh

sample_name=Hesther-de-Ruiter-sample-2
read_length=150
use_mem=no
nr_cores=16
sbatch --job-name=karyhoho --time=6-00:00:00 -c ${nr_cores} --mem=15G --export=ALL,sample_name="${sample_name}",read_length="${read_length}",nr_cores="${nr_cores}",use_mem="${use_mem}" /hpc/hub_oudenaarden/mwehrens/scripts/karyoseq_scripts/sk2parserhuman_nextseq2000_single.sh





