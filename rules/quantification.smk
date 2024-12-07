rule featurecounts:
    input:
        bam="{output_dir}/aligned/{sample}.bam",
        gtf=config["gtf_file"]
    output:
        counts="{output_dir}/counts/{sample}.txt"
    conda:
        "envs/featurecounts.yaml"
    shell:
        "featureCounts -a {input.gtf} -o {output.counts} {input.bam}"
