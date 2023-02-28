# Docker image for FastQC v0.11.9
# Author: Diego Coelho

# Alpine base image
FROM alpine:3.14

CMD ["/bin/sh"]

# File author / Maintainer
LABEL maintainer="diegomscoelho@gmail.com"

# Setup packages
RUN apk add --no-cache wget bash openjdk8 perl

# Get the tool and install it in /usr/local/bin
RUN wget --no-check-certificate http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.9.zip
# Unzip fastqc folder and remove zipped file
RUN unzip fastqc_v0.11.9.zip && rm fastqc_v0.11.9.zip
# Move fastqc app to local path
RUN chmod 750 /FastQC/fastqc && ln -s /FastQC/fastqc /bin/fastqc
