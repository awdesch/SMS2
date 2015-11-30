# clear cache and close windows
graphics.off()
rm(list=ls(all=TRUE))

# setwd("C:/...")      # please change your working directory for loading your data

# install and load packages
libraries = c("MASS")
lapply(libraries, function(x) if (!(x %in% installed.packages())) {
  install.packages(x)
})
lapply(libraries, library, quietly = TRUE, character.only = TRUE) 

load("bank2.rda")      # load bank data

set.seed(100)          # set pseudo random numbers

nahvyber  = sample(1:200, 20, replace = FALSE) # select random sample
dvacet    = bank2[nahvyber,] # retrieve random sample

vysledek  = prcomp(dvacet,scale.=TRUE)$x[,1:2]	# perform principal component analysis

par(mfrow=c(1,2))	
plot(vysledek,type="n",main="20 Swiss bank notes") 
text(vysledek, labels = as.character(rownames(dvacet)),col=as.numeric(as.numeric(rownames(dvacet))<=100)+1)
hc    = hclust(dist(dvacet,method="manhattan"),method="ward.D") # L1 distance and Ward algorithm
dend1 =  as.dendrogram(hc)
par(mar=c(2, 4, 4, 2) +  0.1)
plot(dend1,ylab=bquote(L[1]~distance),xlab="",sub="",main="Ward dendrogram")
