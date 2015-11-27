rm(list=ls(all=TRUE))
graphics.off()

# install and load packages
libraries = c("scatterplot3d")
lapply(libraries, function(x) if (!(x %in% installed.packages())) {
  install.packages(x)
})
lapply(libraries, library, quietly = TRUE, character.only = TRUE)

# setwd("C:/...") # set working directory
# load data
load("bank2.rda")

x       = as.matrix(bank2)
x       = scale(x)
x       = x/sqrt(nrow(bank2))
deco    = svd(x)
w       = deco$v[,1:3]%*%diag(deco$d[1:3])
z       = deco$u[,1:3]%*%diag(deco$d[1:3])
counter = rep(c("G","F"),each=100)
xs      = expression(X[1],X[2],X[3],X[4],X[5],X[6])

opar=par(mfrow=c(2,2))
plot(w[,c(1,2)],type="n",xlab=expression(w[1]),ylab=expression(w[2]),xlim=c(-1.2,1.2),ylim=c(-1,1))
text(w[,c(1,2)],xs)
frame()
plot(w[,c(1,3)],type="n",xlab=expression(w[1]),ylab=expression(w[3]),xlim=c(-1.2,1.2),ylim=c(-1,1))
text(w[,c(1,3)],xs)
plot(w[,c(2,3)],type="n",xlab=expression(w[2]),ylab=expression(w[3]),xlim=c(-1.2,1.2),ylim=c(-1,1))
text(w[,c(2,3)],xs)
dev.new()
par(mfrow=c(2,2))
plot(z[,c(1,2)],type="n",xlab=expression(z[1]),ylab=expression(z[2]))
text(z[,c(1,2)],counter)
frame()
plot(z[,c(1,3)],type="n",xlab=expression(z[1]),ylab=expression(z[3]))
text(z[,c(1,3)],counter)
plot(z[,c(2,3)],type="n",xlab=expression(z[2]),ylab=expression(z[3]))
text(z[,c(2,3)],counter)
dev.new()
par(mfrow=c(1,1))
scatterplot3d(z,color=rep(1:2,each=100),xlab=expression(z[1]),ylab="",zlab=expression(z[3]))
par(opar)
