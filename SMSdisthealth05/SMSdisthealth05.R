# clear cache and close windows
rm(list=ls(all=TRUE))
graphics.off()

#setwd("C:/...")        # please change your working directory

ushealth05        = read.csv("ushealth05.csv",sep=",",header=T) # load ushealth data

ush               = ushealth05[order(ushealth05[,20]),] # order data
ushreg            = as.numeric(ush[,20])                # def. regrion
lab               = paste(ush[,22],ushreg)
row.names(ush)    = lab
ush        = ush[c(which(ush$ANSI==c("ME")),which(ush$ANSI==c("NH")),which(ush$ANSI==c("NY"))),]     # use only Maine, New Hampshire, New York
ush        = ush[,3:12] # for the disease related death causes

# Euclidean distance
dist.eu    = dist(ush,method="euclidean",p=2,diag=T)
dist.eu
# Manhattan distance
dist.ma    = dist(ush,method="manhattan",p=2,diag=T)
dist.ma
# Maximum distance
dist.mi    = dist(ush,method="maximum",p=2,diag=T)
dist.mi
