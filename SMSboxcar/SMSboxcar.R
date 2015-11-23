rm(list=ls(all=TRUE)) # remove variables
graphics.off()        # close all windows
# setwd("C/...")      # set working direktory

load("carc.rda")      # load car data
rb   = boxplot(M~C,data=carc,ylab="Mileage") # boxplot of mileage by company headquarters

mn.t = tapply(carc$M, carc$C, mean)
sd.t = tapply(carc$M, carc$C, sd)
xi   = seq(rb$n)
# add mean and standard deviation (+/-)
for(i in 1:3) lines(c(xi[i]-0.4,xi[i]+0.4), rep(mn.t[i],2), col = "red", lwd=2, lty= "dotted")
arrows(xi+0.3, mn.t - sd.t, xi+0.3, mn.t + sd.t, code = 3, col = "pink", angle = 75, length = .1)