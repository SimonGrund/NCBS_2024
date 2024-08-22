library(data.table)
library(tidyverse)
library(sjmisc)

genelist = readxl::read_excel("Data/Genes.xlsx")
d = fread("Data/GSM1536837_06_01_15_TCGA_24.tumor_Rsubread_FeatureCounts.txt")
d = filter(d, V1 %in% genelist$GENE)
#row.names(d) = d$V1
#d$V1 = NULL
d2 = d %>% rotate_df(cn = T)
d2$Sample = rownames(d2)

#Add cancer type
meta = fread("Data/GSE62944_06_01_15_TCGA_24_CancerType_Samples.txt", col.names = c("Sample", "Cancertype"))

d2 = left_join(d2, meta)%>%
  dplyr::select(Sample, Cancertype, everything())

str(d2)
# d3 = lapply(d2, as.numeric)
# d3 <- sapply( d2, as.numeric )
# d3$Cancertype = d2$Cancertype

d2$Cancertype = as.factor(d2$Cancertype)
#

saveRDS(d2, "Data/Formatted_data.rds")
