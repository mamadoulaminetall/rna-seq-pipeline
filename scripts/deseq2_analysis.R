library(DESeq2)

# Load count matrix
counts <- read.table("results/count_matrix.txt", header=TRUE, row.names=1)

# Define experimental design
condition <- factor(c("Control", "Treated"))
colData <- data.frame(condition)

# Create DESeq dataset
dds <- DESeqDataSetFromMatrix(countData=counts, colData=colData, design=~condition)

# Run differential expression analysis
dds <- DESeq(dds)
res <- results(dds)

# Save results
write.csv(as.data.frame(res), file="results/differential_expression_results.csv")
