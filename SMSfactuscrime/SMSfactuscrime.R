graphics.off()
rm(list=ls(all=TRUE))

# setwd("C:/...") #set your working directory
load("uscrime.rda")

factcrime = factanal(~murder+rape+robbery+assault+burglary+larceny+autotheft,factors=3,rotation="varimax",scores="regression",data=uscrime)
print(factcrime)
facttable = cbind(factcrime$loadings, (1 - factcrime$uniquenesses),factcrime$uniqueness)
colnames(facttable) = c("q1", "q2", "q3", "Communalities", "Specific variances")
print(round(facttable,4))
# xtable(facttable,digits=4)

lab=colnames(uscrime)[3:9]

opar=par(mfrow=c(2,2))
plot(c(-1.1,1.1),c(-1.1,1.1),type="n",main="US crime (varimax)",xlab=expression(q[1]),ylab=expression(q[2])) 
ucircle<-cbind(cos((0:360)/180*3.14159),sin((0:360)/180*3.14159))
points(ucircle,type="l",lty="dotted")
abline(h = 0)
abline(v = 0)
text(factcrime$loadings[,1:2],labels=lab,col="black")

frame()

plot(c(-1.1,1.1),c(-1.1,1.1),type="n",main="US crime (varimax)",xlab=expression(q[1]),ylab=expression(q[3])) 
points(ucircle,type="l",lty="dotted")
abline(h = 0)
abline(v = 0)
text(factcrime$loadings[,c(1,3)],labels=lab,col="black")

plot(c(-1.1,1.1),c(-1.1,1.1),type="n",main="US crime (varimax)",xlab=expression(q[2]),ylab=expression(q[3])) 
points(ucircle,type="l",lty="dotted")
abline(h = 0)
abline(v = 0)
text(factcrime$loadings[,c(2,3)],labels=lab,col="black")


type = as.numeric(uscrime$reg)
type2 = type-1
type2[which(type2==3)]=4

dev.new()
par(mfrow=c(2,2))

plot(factcrime$scores[,1:2],type="n",xlab=expression(f[1]),ylab=expression(f[2]),main="US crime (factor scores)")
points(factcrime$scores[,1:2],cex=0.9,col=type,pch=type2)
text(factcrime$scores[,1:2],row.names(uscrime),cex=0.7,xpd=NA,col=type,pos=4)
frame()

plot(factcrime$scores[,c(1,3)],type="n",xlab=expression(f[1]),ylab=expression(f[3]),main="US crime (factor scores)")
points(factcrime$scores[,c(1,3)],cex=0.9,col=type,pch=type2)
text(factcrime$scores[,c(1,3)],row.names(uscrime),cex=0.7,xpd=NA,col=type,pos=4)

plot(factcrime$scores[,c(2,3)],type="n",xlab=expression(f[2]),ylab=expression(f[3]),main="US crime (factor scores)")
points(factcrime$scores[,c(2,3)],cex=0.9,col=type,pch=type2)
text(factcrime$scores[,c(2,3)],row.names(uscrime),cex=0.7,xpd=NA,col=type,pos=4)


par(opar)

