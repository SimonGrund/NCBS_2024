install.packages("BiocManager", repos = "https://cloud.r-project.org")

packages_to_install = c(
  "tidyverse", "broom", "Rtsne", "M3C", "tidymodels", "skimr", "ggdendro",
  "GGally", "dotwhisker", "vip", "ranger", "data.table",
  "gapminder", "riskCommunicator", "pheatmap", "ape", "cluster", "ggpubr"
)

new_packages = packages_to_install[!(packages_to_install %in% installed.packages()[,"Package"])]

if(length(new_packages) > 0){
  install.packages(new_packages, ask = FALSE, Ncpus = 4L, repos = "https://cran.icts.res.in/")
}

#Some packages need to be installed directly from github. Don't panic if this doesnt work at first,
# we can come help you (especially windows computers sometimes have isssues install devtools, and need
# and updated software called Rtools first which can be downloaded at https://cran.r-project.org/bin/windows/Rtools/)
install.packages("devtools")
devtools::install_github("sebastianbarfort/mapDK")
BiocManager::install("DESeq2")