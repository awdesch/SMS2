
# clear variables and close windows
rm(list=ls(all=TRUE))
graphics.off()

# setwd(Sys.glob("~/downloads/")) # set your working directory

# install and load packages
libraries = c("KernSmooth")
lapply(libraries, function(x) if (!(x %in% installed.packages())) {
  install.packages(x)
})
lapply(libraries, library, quietly = TRUE, character.only = TRUE)

load("carc.rda")

x = cbind(carc[,1], carc[,2], carc[,8], carc[,9])
y = c("price", "mileage", "weight", "length")
p = dim(x)[2]
n = dim(x)[1]

par(mfrow=c(p,p), mar = 0.2 + c(0,0,0,0))        # creates display pxp with margins=0.2

for (k in 0:15) {
  i = (k %/% 4) + 1                              # div, ith raw
  j = (k %% 4) + 1                               # mod, jth column
  if (i>j) {
    plot(x[,i]~x[,j], xlab = "", ylab = "", axes=FALSE, frame.plot=TRUE,pch=as.numeric(carc$C)-1-(carc$C=="Europe")+(carc$C=="Japan"),cex=1.5)
  }
  if (i<j) {
    xx      = cbind(x[,i],x[,j])
    nd      = 15                                 # number of grid points in each dimension
    nd      = matrix(1,1,nrow = dim(xx)[2])*nd   # matrix 2x1 with numbers of grid points in each dimension
    d       = c(apply(t(xx), 1, max) - apply(t(xx), 1, min))/(nd-1)
    h       = c(3.5*sqrt(var(x[,i]))*n^(-1/3),3.5*sqrt(var(x[,j]))*n^(-1/3)); # bandwidth a la Scott's rule of thumb
    minmaxx = c(min(x[,i]), max(x[,i]))
    minmaxy = c(min(x[,j]), max(x[,j]))
    est     = bkde2D(xx, bandwidth=h/2, gridsize=nd, truncate=TRUE, range.x=list(minmaxx, minmaxy))   # estimates 2dimensional density
    contour(est$x1, est$x2, est$fhat,  col="blue", axes=FALSE, frame.plot=TRUE)
  }
  if (i == j) {
    plot(0~0,xlab = "", ylab = "", axes=FALSE, xlim=c(1,5), ylim=c(1,5), frame.plot=TRUE)
    text(2,4.5, y[i], cex=1.5)                   # print text on diagonal graphs
  }
}