#####
# Module 1.3) Clustering
# 
# Simon Grund Sorensen, Jakob Skou Pedersen, Søren Besenbacher, Aarhus University
# 15/08-2023
####

#Load packages
library(tidyverse)
library(ggdendro)

#Load the data including PCs from the last module
d = read_delim("Data/d_w_pca.tsv")
glimpse(?)

# A) 
# Perform k-means clustering on the PCs, with four centers.
PCs = select(d, .fittedPC1, .fittedPC2, .fittedPC3, .fittedPC4, .fittedPC5)

kk = kmeans(x = ?, centers = ?) #Use ?help(kmeans) if yu need help on how to replace the question marks

# B)
# Plot the inferred clusters with different colors on the PC1 vs PC2 plot
# We set clusters as factors instead of numbers, 
#for the graph to look nice. What happens if you hashtag this line and runs the script?
d$Cluster = as.factor(kk$cluster) 

ggplot(d, aes(x = .fittedPC1, y = .fittedPC2))+
  geom_point(aes(color = ?))

# C)
# Try running kmeans and visualising with different numbers of clusters (centers). 


# D)
# How many clusters are too many? How many are too few?

# PART 2: Hierarchical clustering

#First we make a distance matrix of the principal components
dist_mat_PC = dist(?)

#Then we generate hierarchical clustering
clusters = hclust(d = ?)

#Use the ggdendro to make a nice ggplot of the clusters
ggdendrogram(?) 

# Interpret the Dendrogram. How many clusters are there if we cut it at y=10? y=7.5? y=5? What is a good
#place to cut the tree do you think?

