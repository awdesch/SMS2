# clear variables and close windows
rm(list=ls(all=TRUE))
graphics.off()

# install and load packages
libraries = c("MASS")
lapply(libraries, function(x) if (!(x %in% installed.packages())) {
    install.packages(x)})
lapply(libraries, library, quietly = TRUE, character.only = TRUE)

# setwd("C:/...") # please set the working directory
# load data
load("athletic.rda")

x     = athletic[c(1:11,13:35,37,39:54),]       # subsample
x     = scale(x)                                # standardized
d     = dist(x)                                 # distance matrix
loc   = isoMDS(d,maxit=1000,tol = 1e-6)         # nonmetric MDS
xylim = range(loc$points[,1],-loc$points[,2])

# plot
plot(loc$points[,1],-loc$points[,2], main="athletic records", type = "n", ylab=expression(x[2]), xlab=expression(x[1]),xlim=xylim,ylim=xylim)
text(loc$points[,1],-loc$points[,2],labels=row.names(athletic)[c(1:11,13:35,37,39:54)])