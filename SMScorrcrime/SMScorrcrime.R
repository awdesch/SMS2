# clear variables and close windows
rm(list=ls(all=TRUE))
graphics.off()

# setwd("C:/...") # set your working directory
load("uscrime.rda")
x     = uscrime
  
col   = x[,ncol(x)-1]    # region numbers (blue-Northeast, green-Midwest, cyan-South, red- West)
x     = x[,3:(ncol(x)-2)]
xrows = row.names(x)
xcols = names(x)

a     = apply(x,1,sum)   # row sums
b     = apply(x,2,sum)   # column sums
e     = a%*%t(b)/sum(a)

C     = (x-e)/sqrt(e)    # chi-matrix
Y     = svd(C)		     # singular value decomposition
g     = Y$u 
l     = Y$d
v     = Y$v               

## eigenvalues
ll    = l^2

## percentage
per   = cumsum(l^2)/sum(l^2)

# xtable(data.frame(ll,(l^2)/sum(l^2),per))
# multiplies each column of g with each corresponding element of l and devides with each corresponding element of sqrt(a)
r     = (matrix(l,nrow(g),ncol(g),byrow=T)*g)/matrix(sqrt(a),nrow(g),ncol(g),byrow=F)
#rz = diag(a^(-1/2))%*%as.matrix(C)%*%v

# multiplies each column of v with each corresponding element of l and devides with each corresponding element of sqrt(b)
s     = (matrix(l,nrow(v),ncol(v),byrow=T)*v)/matrix(sqrt(b),nrow(v),ncol(v),byrow=F)

car   = t(t((r[,1:3]^2)*apply(x,1,sum))/(l[1:3]^2))   # contribution in r
cas   = t(t((s[,1:3]^2)*apply(x,2,sum))/(l[1:3]^2))    # contribution in s
c1    = car[,1:3]
c2    = cas[,1:3]

rr    = r[,1:2]
ss    = s[,1:2]
rr[,2]= rr[,2]*sign(rr[2,2])
ss[,2]= ss[,2]*sign(ss[6,2])

plot(rr[,1],rr[,2],pch=(as.numeric(col)+c(rep(-1,37),rep(0,13))),xlab=expression(list(r[1],s[1])),ylab=expression(list(r[2],s[2])),main="US crime",ylim=range(rr[,2],ss[,2]),xlim=range(rr[,1],ss[,1]))
points(ss[,1],ss[,2],type="n")
text(ss[,1],ss[,2],xcols,cex=1.8,col="red",xpd=NA)
text(rr[,1],rr[,2],xrows,cex=1,col="blue",pos=4,xpd=NA)
abline(h=0,v=0,lwd=2)




