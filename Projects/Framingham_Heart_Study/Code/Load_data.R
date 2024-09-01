# Always ensure the working directory is set to the correct folder
setwd("Projects/Framingham_Heart_study/")

install.packages("riskCommunicator")
data("framingham", package="riskCommunicator")
str(framingham)

