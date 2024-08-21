#####
# Module 1.2.1
# Wrangling data in R
#
# Simon Grund Sorensen, Jakob Skou Pedersen, Søren Besenbacher, Aarhus University
# 15/08-2023
####

#Loading necessary packages
library(tidyverse)

#Data wrangling is a wide term for managing data including:
## Changing the format of the data (e.g. from short to long)
## Summarizing data (E.g. calculating means and standard deviations)
## Grouping, separating, and aggregating data (E.g. separating lists of information, 
# where the full list is stored in a single column)

# We will use the same data set from the viualisation exercises

# Run this line to load the data.
d <- read_rds("Data/chd_full.rds")

# A)
# Replace the question mark in the statement below to find out how many 
# individuals have a BMI over 50?

d %>%
  filter(? > 50)

# B)
# How many individuals over 50 (years) have a cholesterol (scl) level over 300?


# C)
# Replace the question marks in the statement below to calculate the mean age in
# the data set?

d %>%
  summarise(mean_age = ?)

# D)
# Use the group_by command to calculate the mean age for male and female separate
d %>%
  group_by(?)%>%
  ?


# E)
# It is common to have missing values in the data. 
# In R, we represent these as "NA" which means "not available"
# Let's turn all information for patient no. 100 into NA's to see what happens
d[100,] = NA

d %>% mean(age)

# F)
# Fix above code so that it gives us a mean and ignores the NA
# (you can check the help page for the mean function to find out how to make it 
# ignore NA's (missing values). You can open the the help page by typing ?mean 
# in the console the script window)



# G)
# Fill in the question marks below to add a variable saying the relation between systolic- and
# diastolic bloodpressure (sbp / dbp)

d %>%
  mutate(sdb_dbp_ratio = ?)


# H)
# What is the largest ratio you observe? Hint: Use slice_max(sdb_dbp_ratio)


# I)
# What is the smallest observed cholesterol (scl) level among individuals with a BMI over 40?
# HINT: Use slice_min — use ?slice_min to get more help if you need.

# J)
# Among those individuals that have congential heart disorder  (chdfate==True). 
# What is the median scl level for each gender?


# K)
# Use mutate to add an extra column called age_over_30 indicating whether each individual is 
# older than 30 years. 
d = d %>%
  mutate(age_over_30 = ifelse(age > 30, ?, ?))

# L)
# Calculate the mean scl level for each combination of chdfate and age_over_30 


# M)
# How many patients are there for each combination of chdfate and age_over_30 ?

# N)
# Calculate the mean scl for each Age and chdfate

# O)
# Make a scatter plot with the mean_scl on x axis and Age on the y axis where 
# the color of the data points are determined based on the chdfate


# P)
# Extend the plot from the previous exercise by giving the points different sizes
# based on how many observations each point is based on.


# Q)
# Remove all points that are base on less than 10 observations from the plot 
# from the previous exercise

