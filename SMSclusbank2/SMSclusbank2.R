# clear cache and close windows
rm(list=ls(all=TRUE))
graphics.off()

# install required packages
# install.packages("MASS")
library(MASS)
# setwd("C:/...") # please change your working directory

load("bank2.rda") # load bank notes data

set.seed(100)     # set pseudo random numbers
nahvyber = sample(1:200, 20, replace = FALSE)
dvacet   = bank2[nahvyber,]

vysledek = prcomp(dvacet)$x[,1:2]	# compute principal component analysis

plot(vysledek,type="n",main="20 Swiss bank notes") 
text(vysledek, labels = as.character(rownames(dvacet)),col=as.numeric(as.numeric(rownames(dvacet))<=100)+1)

# cluster analysis on squared euclidean distance of original data using complete linkage
hc       = hclust(dist(dvacet)^2,method="complete")
dend1    =  as.dendrogram(hc)
dev.new()
plot(dend1,main="20 bank notes",xlab="Complete linkage")

# cluster analysis on squared euclidean distance of original data using single linkage
hc2      =  hclust(dist(dvacet)^2,method="single")
dend2 <- as.dendrogram(hc2)
dev.new()
plot(dend2,main="20 bank notes",xlab="Single linkage")

