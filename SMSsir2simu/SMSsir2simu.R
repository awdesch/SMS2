# clear variables and close windows
rm(list=ls(all=TRUE))
graphics.off()

# install and load packages
libraries = c("dr")
lapply(libraries, function(x) if (!(x %in% installed.packages())) {
    install.packages(x)})
lapply(libraries, library, quietly = TRUE, character.only = TRUE)

set.seed(0)
n   = 400
x1  = rnorm(n)
x2  = rnorm(n)
x3  = rnorm(n)
x4  = rnorm(n)
x   = cbind(x1,x2,x3,x4)
e   = rnorm(n)
b1  = c(1,3,0,0)
b2  = c(0,0,-1,1)
i   = c(1:4)
y   = ((x%*%b1)^2)+((x%*%b2)^4)+e

m1  =  dr(y~x, method="save")

f   = m1$evectors
g   = m1$evalues
g
sg  = sum(g)
g   = g/sg
psi = cumsum(g)
ig  = cbind(i,g)
p11 = cbind(x%*%f[,1],y)
p12 = cbind(x%*%f[,2],y)
p21 = cbind(x%*%f[,3],y)

op=par(mfrow=c(2,2))
plot(p11,xlab="1st projection",ylab="response",col="blue",type="p",pch=20)
plot(p12,xlab="2nd projection",ylab="response",col="blue",type="p",pch=20)
plot(p21,xlab="3rd projection",ylab="response",col="blue",type="p",pch=20)
plot(ig,xlim=c(0.9,4.1),ylim=c(0,1.01),xlab="k",ylab="",main="SIR II scree plot",col="black",type="p",pch="*")
points(i,psi)
par(op)