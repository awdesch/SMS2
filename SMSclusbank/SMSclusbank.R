# clear variables and close graphics
rm(list=ls(all=TRUE))
graphics.off()

load("bank2.rda") # load data

set.seed(100)     # set pseudo random numbers

bank = bank2[sample(1:200,20,replace=FALSE),] # 20 randomly selected Swiss bank notes

# plot
opar = par(mfrow = c(1, 2))
pcb=prcomp(bank, scale = TRUE)
plot(pcb$x[,1:2],type="n",main="20 Swiss bank notes")  # principal component analysis
text(pcb$x[,1:2],labels=row.names(bank))               # principal component analysis

# plot squared euclidean distance and ward algorithm.
par(mar=c(2, 4, 4, 2) +  0.1)
plot(hclust(dist(bank,method="euclidean")^2,method="ward"),ylab="squared Euclidean distance",xlab="",sub="",main="Ward dendrogram") #cluster analysis using Ward algorithm and squared Euclidean distance
par(opar)
