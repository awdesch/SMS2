# clear variables and close windows
rm(list=ls(all=TRUE))
graphics.off()

# load data
load("nyse.rda")

# select portfolio
portfolio = nyse[,c(1,2,7)]

returns1 = as.matrix(portfolio)%*%c(1,1,1)/3
par(mfrow=c(2,1),mar=c(5, 4, 3, 2) +  0.1)
setscale = rbind(c(0,-0.28),c(121,0.28))

plot(setscale,type="n",main="equally weighted portfolio",xlab="time",ylab="returns")
abline(h=0)
abline(h=c(-0.2,0.2),lty=2,col="gray50")
lines(returns1)

# optimal portfolio weights
opti = solve(cov(portfolio))%*%c(1,1,1)
opti = opti/sum(opti)

returns2 = as.matrix(portfolio)%*%opti
plot(setscale,type="n",main="variance efficient portfolio",xlab="time",ylab="returns")
abline(h=0)
abline(h=c(-0.2,0.2),lty=2,col="gray50")
lines(returns2)