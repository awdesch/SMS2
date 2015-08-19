# ---------------------------------------------------------------------
# Book:         SMS
# ---------------------------------------------------------------------
# Quantlet:     SMSlinregpull
# ---------------------------------------------------------------------
# Description:  SMSlinregpull computes a linear regression of sales (X1) 
#               on price (X2) from the pullovers data set 
#               (pullover.rda).
# ---------------------------------------------------------------------
# See also:     SMSanovapull, SMSdete2pull, SMSdeterpull, SMSlinregpull,
#               SMSscabank45, SMScovbank
# ---------------------------------------------------------------------
# Keywords:     linear model, linear regression, least squares,
#               
# ---------------------------------------------------------------------
# Usage:        -
# ---------------------------------------------------------------------
# Inputs:       None
# ---------------------------------------------------------------------
# Output:       Linear regression of sales (X1) on price (X2) from the
#               pullovers data set (pullover.rda).
# ---------------------------------------------------------------------
# Example:      -
# ---------------------------------------------------------------------
# Author:       Zdenek Hlavka
# ---------------------------------------------------------------------

# Clear all variables and close windows
 rm(list=ls(all=TRUE))
 graphics.off()

# setwd("C:/...") # please change your working directory

library(MASS)

load("pullover.rda")

lm.pull=lm( Sales~Price,data=pullover)

opar=par(mfrow=c(1,2))

outlier=(abs(stdres(lm.pull))>2)
# plot all data points and the regression line
plot(Sales~Price,data=pullover,type="n",main="Regression with outliers")
points(Sales~Price,data=pullover,subset=!outlier)
points(Sales~Price,data=pullover,subset=outlier,col="red",pch=17)
abline(coef(lm.pull),lty=3)

# re-do the analysis without outliers
lm.pull.2=lm(Sales~Price,data=pullover,subset=!outlier)
abline(coef(lm.pull.2),col="blue")

# boxplot of the original residuals
boxplot(lm.pull$residuals,main="Boxplot of residuals")

par(opar)
