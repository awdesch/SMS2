rm(list=ls(all=TRUE))
graphics.off()

# install and load packages
libraries = c("depth","MASS")
lapply(libraries, function(x) if (!(x %in% installed.packages())) {
    install.packages(x)})
lapply(libraries, library, quietly = TRUE, character.only = TRUE)

# setwd("C:/...") # set working directory
load("bank2.rda")

# simulate data
set.seed(2012)            # sets random seed

x     = as.matrix(bank2)
n     = 20
xxi   = cbind(sort(sample(1:200,n,replace=F)))
y     = prcomp(x[xxi,],scale.=TRUE)$x[,1:2]

m     = med(y,method="Liu")
mm    = m$median
 
med12 = apply(y,2,median)

par(c(1,1),cex=1)
      
plot(y,type="n",xlab="PC1",ylab="PC2",main="simplicial depth of 20 Swiss bank notes")
#median is the big red star
points(mm[1],mm[2],col="red",pch=8,cex=4,lwd=1.5)
points(med12[1],med12[2],col="blue",pch=2,cex=3,lwd=2)

tc    = (xxi<101)
ng    = sum(tc)
nf    = n-ng

# "GENUINE"
 
m     = med(y[1:ng,],method="Liu")
mmg   = m$median # "Deepest point"

#  "coordinatewise median"
medg12= apply(y[1:ng,],2,median)

points(mmg[1],mmg[2],col="red",pch=8,cex=1.5)
points(medg12[1],medg12[2],col="blue",pch=2,cex=1.5)
 
 
# "COUNTERFEIT"

 m    = med(y[(ng+1):n,],method="Liu")
 mmf  = m$median # "Deepest point"

#  "coordinatewise median"
medf12= apply(y[(ng+1):n,],2,median)

points(mmf[1],mmf[2],col="red",pch=8,cex=1.5)
points(medf12[1],medf12[2],col="blue",pch=2,cex=1.5)

text(y,labels=xxi,cex=1.2,xpd=NA)
