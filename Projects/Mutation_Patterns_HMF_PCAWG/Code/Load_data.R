# Always ensure the working directory is set to the correct folder
setwd("Projects/Mutation_Pattern_HWF_PCAWG/")


Cancertype = readxl::read_excel("Data/DNA_Signature_Data_PCAWG_and_HMF.xlsx", sheet = 2, skip = 3)
Signatures = readxl::read_excel("Data/DNA_Signature_Data_PCAWG_and_HMF.xlsx", sheet = 3, skip = 3)
Signatures_scaled = readxl::read_excel("Data/DNA_Signature_Data_PCAWG_and_HMF.xlsx", sheet = 4, skip = 3)
Sig_etiology = readxl::read_excel("Data/DNA_Signature_Data_PCAWG_and_HMF.xlsx", sheet = 5, skip = 0)
