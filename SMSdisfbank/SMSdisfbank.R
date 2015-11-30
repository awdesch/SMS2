# Clear workspace
rm(list=ls(all=TRUE))
graphics.off()

# install and load packages
libraries = c("stats","MASS")
lapply(libraries, function(x) if (!(x %in% installed.packages())) {
    install.packages(x)})
lapply(libraries, library, quietly = TRUE, character.only = TRUE)

# setwd("C:/...") # please change the working directory
load("bank2.rda")

keep       = sample(1:200,20,replace=FALSE)
                                        # 20 randomly selected Swiss bank notes
#keep=c(7,8,16,39,71,73,89,94,94,100,110,121,129,131,149,150,154,161,163,174)
                                        # uncomment for 20 banknotes in the book
bank       = bank2[keep,]                   
truth      = factor(rep(c("Genuine","Forged"),each=100))
group      = truth[keep]

fisher     = lda(bank,grouping=group)
prediction = predict(fisher, bank2)$class

table(truth,prediction)