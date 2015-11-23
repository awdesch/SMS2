rm(list=ls(all=TRUE))                                       # remove variables
graphics.off()                                              # close all windows
# setwd("C/...")                                            # set working direktory

load("unemploy.rda")                                        # load data

x = unemploy[,2]                                            # total unemployment
e = c( 15.1, 15.8, 16.8, 17.1, 17.3, 19.9);                 # unemployment East Germany
w = c( 5.8, 6.2, 7.7, 7.9, 8.7, 9.8, 9.8, 9.8, 10.4, 13.9); # unemployment West Germany

 # calculating means
means = c(mean(x), mean(e), mean(w));
 # producing boxplot without means
boxplot(x,e,w, names = c("All", "East", "West"), main = "Unemployment in Germany");
 # adding means into boxplot
lines(x=c(0.6,1.4),rep(means[1],2),lty=2)
lines(x=c(1.6,2.4),rep(means[2],2),lty=2)
lines(x=c(2.6,3.4),rep(means[3],2),lty=2)