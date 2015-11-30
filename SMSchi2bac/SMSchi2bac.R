# clear memory and close windows
rm(list=ls(all=TRUE))
graphics.off()

load("bac.rda")
chisq.test(bac)