FROM continuumio/miniconda3

# Install Snakemake and required tools
RUN conda install -y snakemake fastqc trimgalore star featurecounts r-base r-essentials
RUN apt-get update && apt-get install -y wget

WORKDIR /app
COPY . /app

ENTRYPOINT ["snakemake"]
