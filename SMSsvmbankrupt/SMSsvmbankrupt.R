rm(list=ls(all=TRUE))
graphics.off()

# install and load packages
libraries = c("kernlab")
lapply(libraries, function(x) if (!(x %in% installed.packages())) {
    install.packages(x)})
lapply(libraries, library, quietly = TRUE, character.only = TRUE)

# setwd("C:/...") # set working directory
load("bankruptcy.rda")

d = data.frame(Profitability=bankruptcy[,1], Leverage=bankruptcy[,2], Bankruptcy=factor(bankruptcy[,3]))
sgm = c(0.2,0.2,1,1,2,2)    # parameter r in anisotropic gaussian kernel
C = c(1,8,1,8,1,8)
#r = c(2,2,0.5,0.5,5,5)	# parameter r in anisotropic gaussian kernel
#C = c(1,1000,1,1000,1,1000)

for (i in 1:6){
ksvm.model = ksvm(Bankruptcy~Leverage+Profitability,data=d, type="C-svc", kernel="rbfdot", kpar=list(sigma=sgm[i]), C=C[i], prob.model=TRUE, cross=4) 
plot(ksvm.model,data=d)
str = paste("s=",sprintf("%0.1f",sgm[i]),", c=",sprintf("%0.1f",C[i]),"                          ",sep="")
title(sub=str)
print(ksvm.model)
}