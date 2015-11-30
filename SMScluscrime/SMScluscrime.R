# clear history and close windows
graphics.off()
rm(list=ls(all=TRUE))

# setwd("C:/...") #set your working directory, create there a subdirectory 'data' for the datasets
 
load("uscrime.rda")

op  = par(mfrow=c(1,2))
lab = paste(row.names(uscrime),uscrime$reg)
row.names(uscrime)=lab
x   = uscrime[,3:9]
x   = t(t(x)-apply(x,2,mean))
x   = as.matrix(x)%*%diag(1/(apply(x,2,sd)))
hc  = hclust(dist(x),"ward")
cl  = cutree(hc,4)
names(cl)
plot(hc,labels=lab,main="Dendogram for US crime, Ward algorithm",xlab="",sub="")
pr  = prcomp(x)
plot(pr$x[,1:2],type="n",main="US crime")
text(pr$x[,1:2],lab,col=as.numeric(cl)+1)
par(op)

## x is dataframe

x   = data.frame(x)
colnames(x)=colnames(uscrime)[3:9]

## table of means in four clusters

sapply(x,tapply,cl,mean)
