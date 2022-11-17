



## Some notes about copying the files

```
# To download file from filesender directly onto the 
# curl -o filename.xx "https://XXX"
curl -o Hesther-de-Ruiter-sample-1.tar "https://filesender.surf.nl/download.php?XXXX"

# Untar command (note copy+paste of this command sometimes leads to weird results)
tar -xvf *.tar
tar -xvf Hesther-de-Ruiter-sample-1.tar
```

## Mapping the data

See `job_submission_script.sh` for examples how to run the job.

## Post-processing the mapped data

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
  