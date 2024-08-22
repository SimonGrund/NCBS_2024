# RNA Expression Analysis of The Cancer Genome Atlas (TCGA) Data

## Introduction
The Cancer Genome Atlas (TCGA) is a landmark cancer genomics program that sequenced and molecularly characterized over 11000 cases of primary cancer samples (The Cancer Genome Atlas Program (TCGA) - NCINational Cancer Institute (.gov)https://www.cancer.gov › ccg › genome-sequencing)

## Data
Much of the data is publicly available. We here look at RNA expression across 9.264 human cancers from various tissues. Data is obtained at https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE62944 but can be found downloaded and filtered to a smaller format in the Data folder. The downloaded and filtered data contains one row per sample, one column indicating cancer type, and >700 columns indicating the count expression of each gene included in our formatted subset. The subset of genes is selected from known cancer genes as reported in https://elifesciences.org/articles/81224#content.
The script we used to subset the data is included in the Code folder, along with a script you can use to load the formatted data.

## Potential questions
- How many samples do we have in each cancer type?
- Do some genes correlate in their expression?
- Can you separate cancer types by unsupervised cluster analysis and/or dimension reduction?
- Can you train a supervised model that differentiates between breast and colon cancer?
  - Evaluate model performance on a held-out test set
  - Evaluate model performance using cross-validation
- Can you train a supervised model that can predict all cancer types?
  - Evaluate model performance on a held-out test set
  - Evaluate model performance using cross-validation
