### AneuFinder automation script ###
setwd("H:/Sequence data analysis/Aneufinder")
library(AneuFinder)
library(GenomeInfoDb)
library(BSgenome.Mmusculus.UCSC.mm10)

# modify project name and bam-file directory
projectName <- "EKUmouseplates"
bamDirectory <- "GKOP025/EKUplate15_S5_"

# set configuration file (mouse or human (GRCh37 or GRCh38))
configFile <- "aneufinder_mouse_all_5Mb_1Mb.config"
#configFile <- "aneufinder_human.config"
#configFile <- "aneufinder_human_hg38.config"

### RUN FROM HERE ###

# generates novel directories from bam-file directory to store analysis files
inputdirs <- list.dirs(bamDirectory, recursive = F)
outputdirs <- list.dirs(bamDirectory, full.names = F, recursive = F)
outputdirs <- paste0("EKUMousePlates output/", outputdirs)

dir.create(path = "EKUMousePlates output")
for(i in 1:length(outputdirs)) {
  dir.create(path =  outputdirs[i])
}

# iterates through bam-file directories and analyses results
for(i in 1:length(inputdirs)) {
  Aneufinder(inputfolder = inputdirs[i],
             outputfolder = outputdirs[i], 
             assembly = 'mm10',
             configfile = configFile)
}

# remove i-scar
remove(i)

