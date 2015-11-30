# clear memory and close windows
graphics.off()
rm(list=ls(all=TRUE))
setwd("C:/...") #set your working directory, create there a subdirectory 'data' for the datasets
load("uscrime.rda")

op   = par(mfrow=c(1,2))
lab  = paste(row.names(uscrime),uscrime$reg)
row.names(uscrime)=lab
x    = uscrime[,3:9]
mcol = apply(x,2,sum)/sum(x)
x    = as.matrix(x/apply(x,1,sum))%*%diag(1/sqrt(mcol))
hc   = hclust(dist(x),"ward")
cl   = cutree(hc,5)
names(cl)
plot(hc,labels=lab,main="Dendogram for US crime, Ward algorithm",xlab="",sub="")
pr   = prcomp(uscrime[,3:9])
plot(pr$x[,1:2],type="n",main="US crime")
text(pr$x[,1:2],lab,col=as.numeric(cl)+1)
par(op)

x    = uscrime[,3:9]
x    = x/apply(x,1,sum)
## x is dataframe of relative frequencies
x    = data.frame(x)
colnames(x)=colnames(uscrime)[3:9]

## table of means in five clusters
sapply(x,tapply,cl,mean)