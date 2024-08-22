# DNA Mutation Pattern Analysis In Pan-Cancer Analysis of Whole Genomes and Hartwig Medical Foundation Data

## Introduction
The Pan-Cancer Analysis of Whole Genomes (PCAWG) study is an international collaboration to identify common patterns of mutation in more than 2,600 cancers, mostly primary (pcawg). The Hartwig Medical Foundation (HMF) is a Dutch foundation that develops and maintains a catalog of whole-genome data on full tumor genomes from metastatic cancers (https://www.hartwigmedicalfoundation.nl/en/). 

## Data
Some of the data is publicly available. We here look at genome-wide mutation patterns  across 6,065 human cancers from various tissues. Data is obtained from the supplementary tables https://elifesciences.org/articles/81224#content, and can also be found downloaded in the data set folder. The downloaded data is an excel sheet with several sheets each containing separate information. All sheets are ‘tidy’ with one sample per row and one feature per column. Take a few moments to look at what is in each sheet. A script is supplied in the Code folder to help you load each sheet into R.

## Potential questions
- How many samples do we have in each cancer type?
- Do some mutational patterns correlate in their expression?
- Can you separate cancer types by unsupervised cluster analysis and/or dimension reduction of the mutation patterns?
- Can you train a supervised model that differentiates between primary (PCAWG) and metastatic (HMF) cancer based on mutation patterns?
  - Evaluate model performance on a held-out test set
  - Evaluate model performance using cross-validation
- Can you train a supervised model that can predict all cancer types?
  - Evaluate model performance on a held-out test set
  - Evaluate model performance using cross-validation

