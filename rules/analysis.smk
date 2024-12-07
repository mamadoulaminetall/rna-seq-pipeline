rule deseq2:
    input:
        counts=expand("{output_dir}/counts/{sample}.txt", sample=config["samples"])
    output:
        results="{output_dir}/differential_expression_results.csv"
    conda:
        "envs/deseq2.yaml"
    script:
        "scripts/deseq2_analysis.R"
