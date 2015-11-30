# clear variables and close windows
rm(list=ls(all=TRUE))
graphics.off()

# install and load packages
libraries = c("MASS")
lapply(libraries, function(x) if (!(x %in% installed.packages())) {
    install.packages(x)})
lapply(libraries, library, quietly = TRUE, character.only = TRUE)

# variables
desc = c("Nissan","Kia","BMW","Audi")
#D = cbind(c(0,2,4,3),c(2,0,6,5),c(4,6,0,1),c(3,5,1,0))
D = cbind(c(0,2,5,3),c(2,0,6,4),c(5,6,0,1),c(3,4,1,0))
D

# main calculation
b = isoMDS(D, k = 2, maxit = 1000,tol=1e-10)

# 2D map
plot(b$points,xlab=expression(x[1]),ylab=expression(x[2]),xlim=c(-4,4),ylim=c(-4,4),main="nonmetric MDS",type="n")
text(b$points,desc,col="blue")

dist(b$points)