
### AneuFinder automation script ###


# Set up the configuration parameters for this dataset.
if (F) {
    source('/Users/m.wehrens/Documents/git_repos/Karyoseq/local/projects/conf-mw_dataset-Hesther202211.R')
    # note that the file "conf-mw_dataset-Hesther202208.R" might not work perfectly any more, as I changed some things after using that code
}


# Load libraries
library(AneuFinder)
library(BSgenome.Hsapiens.UCSC.hg38) # BiocManager::install("BSgenome.Hsapiens.UCSC.hg38")

setwd(paste0(maindir))

# generates novel directories from bam-file directory to store analysis files
input_beddirs <- list.dirs(paste0(maindir, bedDirectory), recursive = F, full.names = F)
inputdirs <- paste0(bedDirectory,'/',input_beddirs)
outputdirs <- paste0(bedDirectory,'_aneuoutput/',input_beddirs)

# BELOW STILL HAS TO BE CHANGED
dir.create(path = paste0(maindir, bedDirectory, "_aneuoutput/"))
for(i in 1:length(outputdirs)) {
  dir.create(path =  paste0(maindir, bedDirectory, "_aneuoutput/", outputdirs[i]))
}

hg38 <- read.table('/Users/m.wehrens/Documents/git_repos/Karyoseq/local/hg38.chrom.sizes.txt', header = TRUE)

# iterates through bam-file directories and analyses results
for(i in 1:length(inputdirs)) {
    
  # i=1
    
  Aneufinder(inputfolder = paste0(maindir, bedDirectory, '/', inputdirs[i]),
             outputfolder = paste0(maindir, bedDirectory, "_aneuoutput/", outputdirs[i]), 
             assembly = hg38,
             configfile = paste0(maindir, configFile))
}

# remove i-scar
remove(i)


# Example code from documentation:
# Aneufinder(inputfolder='folder-with-BAM-or-BED', outputfolder='output-directory', numCPU=2, method=c('edivisive', 'dnacopy','HMM'))



