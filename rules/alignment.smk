rule star_align:
    input:
        fq="data/{sample}_R1.fastq.gz",
        genome=config["reference_genome"]
    output:
        bam="{output_dir}/aligned/{sample}.bam"
    conda:
        "envs/star.yaml"
    shell:
        """
        STAR --genomeDir {input.genome} --readFilesIn {input.fq} --outFileNamePrefix {output.bam}
        """
