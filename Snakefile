configfile: "config/config.yaml"

include: "rules/quality_control.smk"
include: "rules/alignment.smk"
include: "rules/quantification.smk"
include: "rules/analysis.smk"

rule all:
    input:
        expand("{output_dir}/differential_expression_results.csv", output_dir=config["output_dir"]),
        expand("{output_dir}/aligned/{sample}.bam", sample=config["samples"]),
        expand("{output_dir}/qc/{sample}_fastqc.html", sample=config["samples"])
