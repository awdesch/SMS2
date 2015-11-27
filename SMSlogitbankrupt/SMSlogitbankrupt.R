# ---------------------------------------------------------------------
# Book:         SMS
# ---------------------------------------------------------------------
# Quantlet:     SMSlogitbankrupt
# ---------------------------------------------------------------------
# Description:  SMSlogitbankrupt computes a logistic regression of
#               bankruptcy data set (bankruptcy.rda).
# ---------------------------------------------------------------------
# Usage:        -
# ---------------------------------------------------------------------
# Inputs:       None
# ---------------------------------------------------------------------
# Output:       logistic regression of bankruptcy data set (bankruptcy.rda)
# ---------------------------------------------------------------------
# Example:      
# ---------------------------------------------------------------------
# Author:       
# ---------------------------------------------------------------------

# clear variables and close windows
rm(list=ls(all=TRUE))
graphics.off()

# load data
load("bankruptcy.rda")


bankruptcy$Bankruptcy=factor(bankruptcy$Bankruptcy,levels=c(-1,1),labels=c("0","1"))
#1 means bankrupt
names(bankruptcy)=c("Profitability","Leverage","Bankruptcy")

attach(bankruptcy)
m1=glm(Bankruptcy~Profitability+Leverage, family=binomial)
summary(m1)

m2=glm(Bankruptcy~(Profitability+Leverage)^2, family=binomial)
summary(m2)

#anova(m1,m2)

# range
r=sapply(bankruptcy[,1:2],range)

newdata=data.frame(Profitability=rep(seq(r[1,1],r[2,1],length=50),each=50),Leverage=rep(seq(r[1,2],r[2,2],length=50),50))

p1=predict(m1,newdata,type="response")
p2=predict(m2,newdata,type="response")

newdata=data.frame(newdata,p1=p1,p2=p2)

opar=par(mfrow=c(1,1))
#library(ggplot2)

image(newdata$Profitability[50*(1:50)],newdata$Leverage[(1:50)],p1mi<-1-matrix(p1,nrow=50,byrow=TRUE),main="Bankruptcy probability",col=heat.colors(200),xlab="Profitability",ylab="Leverage")
contour(newdata$Profitability[50*(1:50)],newdata$Leverage[(1:50)],p1m<-matrix(p1,nrow=50,byrow=TRUE),main="Bankruptcy probability",add=TRUE,col="gray50")
points(Leverage~Profitability,pch=3*as.numeric(Bankruptcy)-2)
dev.new()
image(newdata$Profitability[50*(1:50)],newdata$Leverage[(1:50)],p2mi<-1-matrix(p2,nrow=50,byrow=TRUE),main="Model with interaction",col=heat.colors(200),xlab="Profitability",ylab="Leverage")
contour(newdata$Profitability[50*(1:50)],newdata$Leverage[(1:50)],p2m<-matrix(p2,nrow=50,byrow=TRUE),main="Bankruptcy probability",add=TRUE,col="gray50")
points(Leverage~Profitability,pch=3*as.numeric(Bankruptcy)-2)
par(opar)



