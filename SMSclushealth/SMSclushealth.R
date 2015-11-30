# clear history, close windows
graphics.off()
rm(list=ls(all=TRUE))
setwd("C:/...") # set your working directory
load("ushealth.rda")
op   = par(mfrow=c(1,2))
lab  = paste(row.names(ushealth),ushealth[,12])
row.names(ushealth)=lab
hc   = hclust(dist(ushealth[,3:9]),"ward.D")
cl   = cutree(hc,4)
names(cl)
plot(hc,labels=lab,main="Dendogram for US health, Ward algorithm",xlab="",sub="")
pr   = prcomp(ushealth[,4:10])
plot(pr$x[,1:2],type="n",main="US health")
text(pr$x[,1:2],lab,col=as.numeric(cl)+1)
par(op)