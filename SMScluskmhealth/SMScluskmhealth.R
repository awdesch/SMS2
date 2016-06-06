graphics.off()
rm(list=ls(all=T))


# setwd("C:/...")
# install required packages
# install.packages("MASS")
library(MASS)
# set pseudo random numbers for algorithm starting value
set.seed(99)

ushealth = read.csv("ushealth05.csv",sep=",",header=T) # load data

results  = kmeans(ushealth[,3:12],4, algorithm="Lloyd") # k-means algorithm

PC       = prcomp(ushealth[3:12])$x[,1:2] # PCA

# first 2 PCs with clusters in 4 colours
plot(PC,type="n",main="US health data") 
cl         = as.numeric(results$cluster)
col        = cl
col[cl==3] = 2
col[cl==2] = 3
text(PC[,1],PC[,2],ushealth$ANSI,col=col)
