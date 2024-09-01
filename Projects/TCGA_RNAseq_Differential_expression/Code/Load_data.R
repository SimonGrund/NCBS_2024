# Always ensure the working directory is set to the correct folder
setwd("Projects/TCGA_RNAseq_Differential_expression/")

# Load the data to see what it looks like.
d = read_rds("Data/Formatted_data.rds")
str(d)
