graphics.off()
rm(list=ls(all=TRUE))

# setwd("C:/...")   # set your working directory

load("annualpopu.rda")  # load data

t      = annualpopu[10:19,2:3] # pic 10 observarions from variables 2 and 3
a      = 1 # colour = black
b      = 2 # colour = red
colour = c(rep(a,5),rep(b,5)) # define colour-dummy for plot 
curve((t[1,1]/sqrt(2)+t[1,2]*sin(x)-42000)/100,-pi,pi,lwd=2,ylim=c(3,27),ylab="42000+Y*e2",main="Andrew's curves")
for(i in 1:10){curve((t[i,1]/sqrt(2)+t[i,2]*sin(x)-42000)/100,-pi,pi,add=TRUE,lwd=2,col=colour[i])}
