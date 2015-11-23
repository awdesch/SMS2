rm(list=ls(all=TRUE))
graphics.off()

x  =  c(1.72,1.83,1.74,1.79,1.94,1.71,1.66,1.60,1.78,1.77,1.85,1.70,1.76)
hist(x, breaks=seq(1.6,1.95,0.05), xlab="height (m)", ylab="", main = "Histogram of student heights")