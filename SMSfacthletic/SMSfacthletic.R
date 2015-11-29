# clear history
rm(list=ls(all=TRUE))
graphics.off()

# setwd("C:/...") # please change your working directory
# load data
load("athletic.rda")

# main calculation
facthle = factanal(athletic,factors=3,rotation="varimax",scores="regression")
print(facthle)
facttable = cbind(facthle$loadings, (1 - facthle$uniquenesses),facthle$uniqueness)
colnames(facttable) = c("q1", "q2", "q3", "Communalities", "Specific variances")
print(round(facttable,4))
# xtable(facttable,digits=4)

lab = colnames(athletic)


par(mfrow=c(2,2))
plot(c(-1.1,1.1),c(-1.1,1.1),type="n",main="Athletic (varimax)",xlab=expression(q[1]),ylab=expression(q[2])) 
ucircle = cbind(cos((0:360)/180*3.14159),sin((0:360)/180*3.14159))
points(ucircle,type="l",lty="dotted")
abline(h = 0)
abline(v = 0)
text(facthle$loadings[,1:2],labels=lab,col="black",xpd=NA)

frame()

plot(c(-1.1,1.1),c(-1.1,1.1),type="n",main="Athletic (varimax)",xlab=expression(q[1]),ylab=expression(q[3])) 
points(ucircle,type="l",lty="dotted")
abline(h = 0)
abline(v = 0)
text(facthle$loadings[,c(1,3)],labels=lab,col="black",xpd=NA)

plot(c(-1.1,1.1),c(-1.1,1.1),type="n",main="Athletic (varimax)",xlab=expression(q[2]),ylab=expression(q[3])) 
points(ucircle,type="l",lty="dotted")
abline(h = 0)
abline(v = 0)
text(facthle$loadings[,c(2,3)],labels=lab,col="black",xpd=NA)

dev.new()
par(mfrow=c(2,2)) 

plot(facthle$scores[,1:2],type="n",xlab=expression(f[1]),ylab=expression(f[2]),main="Athletic (factor scores)")
text(facthle$scores[,1:2],row.names(athletic),cex=0.7,xpd=NA)
frame()
plot(facthle$scores[,c(1,3)],type="n",xlab=expression(f[1]),ylab=expression(f[3]),main="Athletic (factor scores)")
text(facthle$scores[,c(1,3)],row.names(athletic),cex=0.7,xpd=NA)
plot(facthle$scores[,c(2,3)],type="n",xlab=expression(f[2]),ylab=expression(f[3]),main="Athletic (factor scores)")
text(facthle$scores[,c(2,3)],row.names(athletic),cex=0.7,xpd=NA)

o1=order(facthle$scores[,1])
o2=order(facthle$scores[,2])
o3=order(facthle$scores[,3])
row.names(athletic)[o1]
row.names(athletic)[o2]
row.names(athletic)[o3]
