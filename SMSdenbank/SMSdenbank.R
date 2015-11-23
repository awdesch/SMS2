# remove variables and close windows
 rm(list=ls(all=TRUE))
 graphics.off()

# setwd("C:/...")                                 # set working directory
load("bank2.rda")                                 # load data
bank  = bank2[,6]                                 # sixth column (X6)
x1    = bank[1:100]                               # genuine bank notes
x2    = bank[101:200]                             # counterfeit bank notes
h.opt = c(sd(x1),sd(x2))*length(x1)^(-1/5)*1.06   # Silverman's rule of thumb
fh1   = density(x1,kernel="gaussian",bw=h.opt[1]) # kernel density estimation for the diagonal of genuine bank notes
fh2   = density(x2,kernel="gaussian",bw=h.opt[2]) # kernel density estimation for the diagonal of counterfeit bank notes
plot(fh1,xlim=c(137.5,143),ylim=c(0.0,0.9),xlab="Counterfeit    /    Genuine",ylab="density estimates for diagonals",main="Swiss bank notes")
lines(fh2,lty=2)