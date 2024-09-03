library(tidyverse)
library(GenomicRanges)
library(DESeq2)
# Always ensure the working directory is set to the correct folder
#setwd("/Users/simon/Documents/NCBS_2024/NCBS_2024/Projects/TCGA_RNAseq_Differential_expression/")
setwd("Projects/TCGA_RNAseq_Differential_expression/")

# Load the data to see what it looks like.
d = read_rds("Data/Formatted_data.rds")
str(d)
d = d[complete.cases(d),] #Remove rows with missing values

#Prepare counts for Deseq2
#countData = pivot_longer(d, cols = -c("Sample", "Cancertype"), names_to = "Gene", values_to = "counts")
countData = d %>% dplyr::select(-Sample, -Cancertype) #Select only counts columns
countData = t(countData) #Transpose the matrix, as we need genes to be rows and samples to be columns, for deseq2

# Format the colData
colData = d %>% dplyr::select(Sample, Cancertype)
colData$Cancertype = as.factor(colData$Cancertype)

# Get gene lengths
library(biomaRt)
#ensembl_list <- c("ENSG00000000003","ENSG00000000419","ENSG00000000457","ENSG00000000460")
genelist = rownames(countData)
human <- useMart("ensembl", 
                 dataset="hsapiens_gene_ensembl",
                 host="grch37.ensembl.org")
gene_coords=getBM(attributes=c("hgnc_symbol","ensembl_gene_id", "start_position","end_position", "chromosome_name"), 
                  filters="hgnc_symbol", 
                  values=genelist, 
                  mart=human,
                  curl = curl::new_handle(timeout_ms=3600000))
#gene_coords$size=gene_coords$end_position - gene_coords$start_position
gene_coords

# Filter and reorder the countData - is a matrix, so have to use Base R for once. 
countData = countData[rownames(countData) %in% gene_coords$hgnc_symbol,]
#Reorder the gene_coords to match with the row order of countData
gene_coords = gene_coords[match(rownames(countData), gene_coords$hgnc_symbol),]

#Convert teh gene coordinates to gRanges for DESeq2
gene_coords = gene_coords %>%
  dplyr::rename("chr" = chromosome_name, "start" = start_position, "end" = end_position)
gene_coords = makeGRangesFromDataFrame(gene_coords)

# Convert reads to RPKM using dcolData# Convert reads to RPKM using deseq2
#BiocManager::install("DESeq2")
dds = DESeq2::DESeqDataSetFromMatrix(countData = countData, colData = colData, design = ~ Cancertype)
rowRanges(dds) = gene_coords #Add the ranges to enable normalizing by gene lengtths
#dds = DESeq2::DESeq(dds)

FPKM = DESeq2::fpkm(dds)
rownames(FPKM) = rownames(countData)
FPKM = as.data.frame(t(FPKM))
FPKM$Sample = d$Sample
FPKM$Cancertype = d$Cancertype
FPKM = dplyr::select(FPKM, Sample, Cancertype, everything())

# Save data as tab seperated values
save(FPKM, file = "Data/FPKM_data.rds")
