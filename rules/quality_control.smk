rule fastqc:
    input:
        fq="data/{sample}_R1.fastq.gz"
    output:
        html="{output_dir}/qc/{sample}_fastqc.html",
        zip="{output_dir}/qc/{sample}_fastqc.zip"
    conda:
        "envs/fastqc.yaml"
    shell:
        "fastqc {input.fq} -o {output_dir}/qc/"
