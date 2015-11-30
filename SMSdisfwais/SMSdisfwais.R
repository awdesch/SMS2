# Clear workspace
rm(list=ls(all=TRUE))
graphics.off()

# install and load packages
libraries = c("stats","MASS")
lapply(libraries, function(x) if (!(x %in% installed.packages())) {
    install.packages(x)})
lapply(libraries, library, quietly = TRUE, character.only = TRUE)

# setwd("C:/...") # please change the working directory
load("wais.rda")

fisher.w=lda(group~.-subject,prior=c(0.5,0.5),data=wais)
prediction=predict(fisher.w, wais)$class

t=table(wais$group,prediction)

print(t)
aper=(sum(t)-sum(diag(t)))/sum(t)
print(aper)

correct=0

for (i in 1:nrow(wais)) {
  fisher.t=lda(group~.-subject,prior=c(0.5,0.5),subset=-i,data=wais)
  predict=predict(fisher.t, wais[i,])$class
  if (predict==wais[i,"group"]) correct=correct+1
}

aer=1-correct/nrow(wais)
print(aer)
