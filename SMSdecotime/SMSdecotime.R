
# clear history, close windows
rm(list=ls(all=TRUE))
graphics.off()

# setwd("C:/...") # set working directory

load("timebudget.rda")

timebudget = as.matrix(timebudget)

n = nrow(timebudget) # rows of data matrix 
p = ncol(timebudget) # columns of data matrix 

 one = matrix(1,n,n)
 h = diag(n)-one/n       # centering matrix 
 xs = h%*%timebudget              # centered data

 xs = xs/sqrt(n)                
 xs2 = t(xs)%*%xs 
 ei = eigen(xs2)          # spectral decomposition 
 lambda = ei$values
 gamma = ei$vectors

 w = -t(t(gamma)*sqrt(lambda))       # coordinates of food 
 w = w[,1:2]                       
 z = -xs%*%gamma                     # coordinates of families 
 z = z[,1:2]                       

tau = cumsum(lambda)/sum(lambda)
tau

########## 
# different code: output differs from original Xplore
# transformation
# x = t((t(as.matrix(timebudget))-mean(timebudget)))/sqrt(nrow(timebudget))
# singular value decomposition                   
# deco = svd(x)
# w=deco$v[,1:2]%*%diag(sqrt(deco$d[1:2]))
# z=deco$u[,1:2]%*%diag(sqrt(deco$d[1:2]))
##########

# plot
opar=par(mfrow=c(1,2))
plot(w,type="n",xlab=expression(w[1]),ylab=expression(w[2]))
title("activities")
text(w,colnames(timebudget))
lines(c(0,0),c(-500,500),lwd=2)
lines(c(-500,500),c(0,0),lwd=2)
plot(z,type="n",xlab=expression(z[1]),ylab=expression(z[2]))
title("individuals")
text(z,row.names(timebudget))
lines(c(0,0),c(-500,500),lwd=2)
lines(c(-500,500),c(0,0),lwd=2)
par(opar)