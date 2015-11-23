rm(list=ls(all=TRUE))
graphics.off()

load("annualpopu.rda")

plot(Unemployed~Inhabitants, xlab="Inhabitants", ylab="Unemployment", main="Scatterplot", data=annualpopu)