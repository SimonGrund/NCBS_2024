#setwd("Projects/TCGA_RNAseq_Differential_expression/")

# Load the data to see what it looks like.
d = read_rds("Data/Formatted_data.rds")
str(d)
d = d[complete.cases(d),] #Remove rows with missing values

#Filter to two cancertypes of interest:
d = filter(d, Cancertype %in% c("BRCA", "LUAD")) #Breast and lung

#Prepare counts for Deseq2
countData = d %>% dplyr::select(-Sample, -Cancertype) #Select only counts columns
countData = t(countData) #Transpose the matrix, as we need genes to be rows and samples to be columns, for deseq2

# Format the colData (metadata, in our case just Cancertype). 
colData = d %>% dplyr::select(Sample, Cancertype)
colData$Cancertype = as.factor(colData$Cancertype)

#Run deseq2
dds = DESeq2::DESeqDataSetFromMatrix(countData = countData, colData = colData, design = ~ Cancertype)
dds = DESeq2::DESeq(dds)

#Look at the results
res <- results(dds)
res 

# Convert to data frame so that we can keep the data tidy
res = as.data.frame(res)
res$gene_id = row.names(countData)
res = res %>%
  dplyr::select(gene_id, everything()) #Reorder the columns so gene_ID cmes first

#Plot the fold changes
ggplot(res, aes(x = log2FoldChange)) +
  geom_histogram(bins = 100) +
  theme_minimal()

#Make a volcano plot
res = res %>%
  mutate(padj = p.adjust(pvalue, method = "BH")) #Correct for multiple testing
ggplot(res, aes(x = log2FoldChange, y = -log10(pvalue))) +
  geom_point(aes(color = padj < 0.05)) +
  theme_minimal() +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed") + 
  geom_vline(xintercept = c(-1, 1), linetype = "dashed") +
  labs(x = "log2 fold change", y = "-log10 p-value") +
  scale_color_manual(values = c("grey", "red"))

# Looks like a normal distribution with some outliers on either side. Let's print the most extreme genes
res %>%
  arrange(desc(abs(log2FoldChange))) %>%
  head(10)

# What is the most pronounced gene? What does ESR1 stand for?

#Plot the raw counts of ESR1 for luad and brca, with boxplots.
ggplot(d, aes(x = Cancertype, y = ESR1)) +
  geom_boxplot() +
  theme_minimal() +
 # labs(y = "ESR1 counts") +
  scale_y_log10() + 
  geom_jitter(width = 0.2, alpha = 0.2)

ggplot(d, aes(x = Cancertype, y = AR)) +
  geom_boxplot() +
  theme_minimal() +
 # labs(y = "ESR1 counts") +
  scale_y_log10() + 
  geom_jitter(width = 0.2, alpha = 0.2)

ggplot(d, aes(x = Cancertype, y = EREG)) +
  geom_boxplot() +
  theme_minimal() +
  # labs(y = "ESR1 counts") +
  scale_y_log10() + 
  geom_jitter(width = 0.2, alpha = 0.2)
