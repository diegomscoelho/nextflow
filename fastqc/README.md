# fastqC

## Build docker image
```sh

docker build -t fastqc:v0.11.9

```

## Run nextflow
```sh

## It will get all paired fastq files in folder `data`
nextflow run main.nf

## It will only run fastqc for a file, i.e:
nextflow run main.nf --reads data/<fastq-files>_{1,2}.fastq.gz
nextflow run main.nf --reads <PATH-TO>/*.fastq.gz

```