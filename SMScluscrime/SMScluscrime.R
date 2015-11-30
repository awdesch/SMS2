# clear history and close windows
graphics.off()
rm(list=ls(all=TRUE))

# setwd("C:/...") #set your working directory, create there a subdirectory 'data' for the datasets
 
load("uscrime.rda")

op   = par(mfrow=c(1,2))
lab  = paste(row.names(uscrime),as.numeric(uscrime$reg))
row.names(uscrime)=lab
x    = uscrime[,3:9]
x    = t(t(x)-apply(x,2,mean))
x    = as.matrix(x)%*%diag(1/(apply(x,2,sd)))
hc   = hclust(dist(x),"ward.D")
cl   = cutree(hc,4)
names(cl)
opar = par(mar=c(2, 5, 4, 2) +  0.1)
plot(hc,labels=lab,main="Ward dendrogram for US crime",xlab="",sub="",cex=0.7,ylab="Euclidean distance")
pr   = prcomp(x)
plot(pr$x[,1:2],type="n",main="US crime")
text(pr$x[,1:2],lab,col=as.numeric(cl)+1)
#par(op)

## Cluster 1
substr(lab[cl==1],1,5)
# Cluster 2
substr(lab[cl==2],1,5)
# cluster 3
substr(lab[cl==3],1,5)
# cluster 4
substr(lab[cl==4],1,5)

## x is dataframe

x     = data.frame(x)
colnames(x)=colnames(uscrime)[3:9]

# clusters and regions
table(uscrime$reg,cl)

## table of means in four clusters
sapply(x,tapply,cl,mean)
cl.eucl= cl