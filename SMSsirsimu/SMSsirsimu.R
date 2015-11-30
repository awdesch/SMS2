rm(list=ls(all=TRUE))
graphics.off()


# install and load packages
libraries = c("dr","MASS")
lapply(libraries, function(x) if (!(x %in% installed.packages())) {
    install.packages(x)})
lapply(libraries, library, quietly = TRUE, character.only = TRUE)

# set seed for pseudo random numbers
set.seed(0)

n     = 400 #number of observations

# vectors of normal random numbers
x1 = rnorm(n) 
x2 = rnorm(n)
x3 = rnorm(n)
x4 = rnorm(n)
x = cbind(x1,x2,x3,x4)

# error term
e     = rnorm(n)

b1    = c(1,3,0,0)
b2    = c(0,0,1,-1)
i     = c(1,2,3,4)
y     = ((x%*%b1)^2)+((x%*%b2)^4)+e
 
 EDR   = dr(y~x,method="sir")
 f     = EDR$evectors
 g     = EDR$evalues

#f1    = ((x%*%b1)^2)+((x%*%b2)^4)
#m1    = cbind((x%*%b1),y)
#m2    = cbind((x%*%b2),y)
#m1    = m1[order(m1[,2],decreasing=T),]
#m2    = m2[order(m2[,2],decreasing=T),]

sg    = sum(g)
g     = g/sg
psi   = cumsum(g)

ig    = cbind(i,g)

p11   = cbind(as.matrix(x)%*%f[,1],y)

p12   = cbind(as.matrix(x)%*%f[,2],y)

p21   = cbind(as.matrix(x)%*%f[,3],y)

par(mfrow=c(2,2))
plot(p11, type="n", xlab="1st projection", ylab="response")
points(p11,pch=19,cex=0.7,col="blue3")

plot(p12, type="n", xlab="2nd projection", ylab="response")
points(p12,pch=19,cex=0.7,col="blue3")

plot(p21, type="n", xlab="3rd projection", ylab="response")
points(p21,pch=19,cex=0.7,col="blue3")

plot(ig, type="n", xlab="k",ylab="",ylim=c(0,1))
title("SIR scree plot")
points(ig, pch="*",col="black",cex=1)
points(cbind(i,psi),pch=1,col="black",cex=1)
