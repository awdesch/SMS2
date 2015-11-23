rm(list=ls(all=TRUE))
graphics.off()

# load data
load("carc.rda")

# install and load packages
libraries = c("MASS")
lapply(libraries, function(x) if (!(x %in% installed.packages())) {
  install.packages(x)
})
lapply(libraries, library, quietly = TRUE, character.only = TRUE)

parcoord(sapply(carc[,1:13],as.numeric),col=as.numeric(carc$C),lty=as.numeric(carc$C)-(carc$C=="Europe")+(carc$C=="Japan"),lwd=1,main="Cars data")