# clear workspace
 graphics.off()
 rm(list=ls(all=TRUE))
# setwd("C:/...") #set your working directory
load("ushealth.rda")

facthealth=factanal(~acc+card+canc+pul+pneu+diab+liv,factors=3,rotation="varimax",scores="regression",data=ushealth)
print(facthealth,cutoff=0.001)
communalities = (1 - facthealth$uniquenesses)
facttable = cbind(facthealth$loadings,communalities,facthealth$uniqueness)
colnames(facttable) = c("q1", "q2", "q3", "Communalities", "Specific variances")
print(round(facttable,4))
# xtable(facttable,digits=4)

lab=colnames(ushealth)[3:9]


opar=par(mfrow=c(2,2))
plot(c(-1.1,1.1),c(-1.1,1.1),type="n",main="US health (varimax)",xlab=expression(q[1]),ylab=expression(q[2])) 
ucircle<-cbind(cos((0:360)/180*3.14159),sin((0:360)/180*3.14159))
points(ucircle,type="l",lty="dotted")
abline(h = 0)
abline(v = 0)
text(facthealth$loadings[,1:2],labels=lab,col="black")

frame()

plot(c(-1.1,1.1),c(-1.1,1.1),type="n",main="US health (varimax)",xlab=expression(q[1]),ylab=expression(q[3])) 
points(ucircle,type="l",lty="dotted")
abline(h = 0)
abline(v = 0)
text(facthealth$loadings[,c(1,3)],labels=lab,col="black")


plot(c(-1.1,1.1),c(-1.1,1.1),type="n",main="US health (varimax)",xlab=expression(q[2]),ylab=expression(q[3])) 
points(ucircle,type="l",lty="dotted")
abline(h = 0)
abline(v = 0)
text(facthealth$loadings[,c(2,3)],labels=lab,col="black")

type = as.numeric(ushealth$reg)
type2 = type-1
type2[which(type2==3)]=4
dev.new()
par(mfrow=c(2,2))

plot(facthealth$scores[,1:2],type="n",xlab=expression(f[1]),ylab=expression(f[2]),main="US health (factor scores)")
points(facthealth$scores[,1:2],cex=0.9,col=type,pch=type2)
text(facthealth$scores[,1:2],row.names(ushealth),xpd=NA,cex=0.7,col=type,pos=4)
frame()
plot(facthealth$scores[,c(1,3)],type="n",xlab=expression(f[1]),ylab=expression(f[3]),main="US health (factor scores)")
points(facthealth$scores[,c(1,3)],cex=0.9,col=type,pch=type2)
text(facthealth$scores[,c(1,3)],row.names(ushealth),xpd=NA ,cex=0.7,col=type,pos=4)
plot(facthealth$scores[,c(2,3)],type="n",xlab=expression(f[2]),ylab=expression(f[3]),main="US health (factor scores)")
points(facthealth$scores[,c(2,3)],cex=0.9,col=type,pch=type2)
text(facthealth$scores[,c(2,3)],row.names(ushealth),xpd=NA,cex=0.7,col=type,pos=4)


par(opar)

