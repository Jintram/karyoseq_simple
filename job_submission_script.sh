
# for playing around:
# srun --nodes=1 -c 1 --mem=64G --time=5:00:00 --pty bash -i

sbatch /hpc/hub_oudenaarden/mwehrens/scripts/karyoseq_scripts/sk2parserhuman_nextseq2000_single.sh



sample_name=Hesther-de-Ruiter-sample-1
read_length=150
use_mem=no
nr_cores=16
last_jobid=$(sbatch  --parsable --job-name=karyhoho --time=6-00:00:00 -c ${nr_cores} --mem=15G --export=ALL,sample_name="${sample_name}",read_length="${read_length}",nr_cores="${nr_cores}",use_mem="${use_mem}" /hpc/hub_oudenaarden/mwehrens/scripts/karyoseq_scripts/sk2_bwamapper_MW.sh)
# parsing with 1 core:
sbatch --dependency=afterany:${last_jobid} --job-name=karyho2o --time=6-00:00:00 --mem=15G --export=ALL,sample_name="${sample_name}",read_length="${read_length}",nr_cores="${nr_cores}",use_mem="${use_mem}" /hpc/hub_oudenaarden/mwehrens/scripts/karyoseq_scripts/sk2_parser_MW.sh

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




