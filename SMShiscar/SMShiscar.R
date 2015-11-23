rm(list=ls(all=TRUE))
graphics.off()

load("carc.rda")   # load data

opar=par(mfrow=c(2,2))
hist(carc$M[carc$C=="US"],     main="U.S. cars",     xlim=c(10,45), xlab="")
hist(carc$M[carc$C=="Japan"],  main="Japanese cars", xlim=c(10,45), xlab="")
hist(carc$M[carc$C=="Europe"], main="European cars", xlim=c(10,45), xlab="")
hist(carc$M,                   main="All cars",      xlim=c(10,45), xlab="")
par(opar)