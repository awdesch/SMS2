 # clear variables and close windows
rm(list=ls(all=TRUE))
graphics.off()

# setwd(C:/...) # set working directory
 # load data
load("carc.rda")

carc=carc[,c("M","W","D","C","P")]
names(carc)=c("Mileage","Weight","Displacement","Origin","Price")

attach(carc)
 # linear model with origin
summary(lm3<-lm(log(Mileage)~log(Weight)+Origin))

 # interaction is not significant
summary(lm3.int<-lm(log(Mileage)~(log(Weight)+Origin)^2))
anova(lm3,lm3.int)

par(mfrow=c(1,1))
plot(log(Mileage)~log(Weight),pch=as.numeric(Origin)-(Origin=="US")-2*(Origin=="Europe"),col=as.numeric(Origin)+1)
oo=order(carc$Weight)
c3=coef(lm3.int)
abline(c(c3[1],c3[2]),col=2) # US
abline(c(c3[1]+c3[3],c3[2]+c3[5]),col=3,lty=2) # Japan
abline(c(c3[1]+c3[4],c3[2]+c3[6]),col=4,lty=3) # Europe

detach(carc)
