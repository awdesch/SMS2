# clear workspace
 graphics.off()
 rm(list=ls(all=TRUE))

# setwd("C:/...") #set your working directory
load("vocabulary.rda")

voc       = vocabulary[,1:4] 
factvocab = factanal(voc, factors=1,scores="Bartlett")
facttable = cbind(factvocab$loadings, (1 - factvocab$uniquenesses),factvocab$uniqueness)
colnames(facttable) = c("q1", "Communalities", "Specific variances")
print(round(facttable,4))
# xtable(facttable,digits=4)
plot(factanal(voc, factors=1,scores="Bartlett")$scores,type="n",xlab="",ylab="Score")
text(factanal(voc, factors=1,scores="Bartlett")$scores,rownames(voc))