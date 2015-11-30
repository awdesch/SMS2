# clear variables and close windows
rm(list=ls(all=TRUE))
graphics.off()

# install and load packages
libraries = c("MASS")
lapply(libraries, function(x) if (!(x %in% installed.packages())) {
    install.packages(x)})
lapply(libraries, library, quietly = TRUE, character.only = TRUE)

# load data
load("bank2.rda")

# factor variable
counter = rep(c("G","F"),each=100)

# main calculation
sol     = cmdscale(dist(bank2))
corr    = cor(cbind(sol,bank2))[3:8,1:2]
corr    = t(t(corr[,1:2])*sign(corr[1,1]))
sol     = t(t(sol[,1:2])*sign(sol[1,1:2]))

# plot
opar    = par(mfrow=c(1,2))

# plot of coordinates
plot(sol,type="n",xlab=expression(x[1]),ylab=expression(x[2]),main="metric MDS")
text(sol,counter,col=rep(1:2,each=100))

# plot of correlations of mds with original variables
plot(c(-1.1,1.1),c(-1.1,1.1),type="n",main="correlations",xlab=expression(x[1]),ylab=expression(x[2]))
ucircle = cbind(cos((0:360)/180*3.14159),sin((0:360)/180*3.14159))
points(ucircle,type="l",lty="dotted")
abline(h = 0)
abline(v = 0)
text(corr,labels=colnames(bank2),col="black",xpd=NA)

par(opar)
