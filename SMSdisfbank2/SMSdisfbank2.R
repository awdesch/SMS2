# clear variables and close windows
rm(list=ls(all=TRUE))
graphics.off()

# install and load packages
libraries = c("stats","MASS","KernSmooth")
lapply(libraries, function(x) if (!(x %in% installed.packages())) {
    install.packages(x)})
lapply(libraries, library, quietly = TRUE, character.only = TRUE)

# setwd("C:/...") # set working directory
load("bank2.rda")
truth     = factor(rep(c("Genuine","Forged"),each=100))

# centering
x         = t(t(as.matrix(bank2))-sapply(bank2,mean))
# sphering
t         = eigen(var(x))
v12       = t$vectors%*%diag(1/sqrt(t$values))%*%t(t$vectors)
x         = x%*%v12
fisher    = as.matrix(x)%*%(lda(truth~x)$scaling)
fisher    = (fisher-mean(fisher))/sd(fisher)
principal = prcomp(x,scale.=TRUE)$x[,1]
est.p     = bkde(principal, bandwidth=0.25)
est.f     = bkde(fisher, bandwidth=0.25)
dum       = rbind(c(min(c(est.p$x,est.f$x)),-0.2),c(max(c(est.p$x,est.f$x)),max(c(est.p$y,est.f$y))))

plot(dum,type="n",main="Fisher's LDA and PC projection",xlab="",ylab="")
lines(est.f,col="red", lwd=2)
lines(est.p,col="blue", lty=2, lwd=2)
t         = (runif(200)*0.09)-0.095
points(t~fisher,col="red",pch=c(rep(1,100),rep(2,100)),cex=1)
t         = (runif(200)*0.09)-0.195
points(t~principal,col="blue",pch=c(rep(1,100),rep(2,100)),cex=1)
