# Clear variables and close windows
graphics.off()
rm(list=ls(all=TRUE))
#setwd("C:/...")         #set your working directory, create there a subdirectory 'data' for the datasets

load("nyse.rda")
attach(nyse)

pi = lm(PanAm~IBM)				    #linear models
di = lm(DEC~IBM)

par(mfrow=c(1,2)) #plot of the results
plot(PanAm~IBM,col="blue",main="PanAm vs. IBM",xlim=c(-0.19,0.19),ylim=c(-0.41,0.41))
abline(pi)
plot(DEC~IBM,col="blue",main="DEC vs. IBM",xlim=c(-0.19,0.19),ylim=c(-0.41,0.41))
abline(di)

detach(nyse)