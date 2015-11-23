graphics.off()                                                       # close windows
rm(list=ls(all=TRUE))                                                # clear variable list

# setwd("C:/...")        
load("bank2.rda")                                                    # load data
d     = data.frame(diagon=bank2[,6],kateg=rep(1:2,each=100))         # set data frame
d[,2] = factor(d[,2], levels=1:2, labels=c("Genuine","Counterfeit")) # set groups
boxplot(diagon~kateg,main="Swiss bank notes",data=d)                 # boxplot of diagonal of banknotes for both types of bank notes