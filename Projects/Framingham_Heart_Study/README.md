# Cardiovascular Health Analysis With The Framingham Data Set
Cardiovascular Health Analysis With The Framingham Data Set

## Introduction
The Framingham Heart Study is an ongoing study of cardiovascular health of residents of the city of Framingham, Massachusetts. The study includes measurements of several potential biomarkers of cardiovascular disease and has laid the foundation to much of our current understanding of associations between lifestyle and health. 

## Data
The data is accessible directly through R, and can be loaded by using the load_data.R script in the Code folder or by copying below code into your own script:

     install.packages("riskCommunicator")
     data("framingham", package="riskCommunicator")
     str(framingham)

## Potential questions
- How many individuals are in the data?
- How many men and women, and what ages?
- How do the biomarkers correlate?
- Can you separate gender by unsupervised cluster analysis and/or dimension reduction?
- Can you train a supervised model that differentiates between individuals that reached cardiovascular disease (chdfate == T) and those that did not?
    - Evaluate model performance on a held-out test set
    - Evaluate model performance using cross-validation
    - Regularize a model to identify the optimal set of included biomarkers
