# clear variables and close windows
rm(list=ls(all=TRUE))
graphics.off()

# main calculation
y1 = c(1,3,2,5,4,6)  
y2 = c(7,8,9,10,12,11)
y3 = c(13,15,14,16,17,18)  
Y1 = rbind(y1,y2,y3)          #loading preferences - 3 levels of motors

y1 = c(1,3,2,7,8,9,13,15,14) 
y2 = c(5,4,6,10,12,11,16,17,18)
Y2 = rbind(y1,y2)             #loading preferences - 2 levels of safety

y1 = c(1,7,13,5,10,16)  
y2 = c(3,8,15,4,12,17)
y3 = c(2,9,14,6,11,18)
Y3 = rbind(y1,y2,y3)          #loading preferences - 3 levels of doors


CId = function(y){            #auxiliary functions for 95% confidence interval
mean(y)-qt(.975,length(y)-1)*sd(y)/sqrt(length(y))
}

CIu = function(y){
mean(y)+qt(.975,length(y)-1)*sd(y)/sqrt(length(y))
}

DoIt = function(Y){           #function that solves the problem...

y = NULL                      #alternative representation of Y
for (i in 1:nrow(Y)){
y = c(y,Y[i,])
}                            
                             #factor of the data - argument for levene.test
Factor = c(rep(1:nrow(Y),each=ncol(Y)))

                             #auxiliary terms for lm
X = kronecker(diag(1,nrow(Y)),c(rep(1,ncol(Y))))

A = anova(lm(y~X))            #ANOVA

print("GROUPS DESCRIPTION")  #print table 
prmatrix(round(cbind(apply(Y,1,length),apply(Y,1,mean),apply(Y,1,sd),apply(Y,1,CId),apply(Y,1,CIu)),4),collab=c("Count","Mean","St. Dev.","95% Conf. I.","for Mean"),quote=FALSE)
print("----------------------------------------------------------------------- ")
print("ANALYSIS OF VARIANCE")
prmatrix(cbind(c("Between Groups","Within Groups"),A$Df,round(A$"Sum Sq",4),round(A$"F value",4),round(A$"Pr(>F)",4)),collab=c("Source of Variance","Df.","Sum of Sq.","F value","Sign."),right=TRUE,quote=FALSE,na.print=" ")
print("----------------------------------------------------------------------- ")
#print("LEVENE TEST FOR HOMOGENITY OF VARIANCES")
#prmatrix(round(cbind(as.matrix(L$statistic)[1],L$p.value),4),collab=c("Statistic","Sign."),quote=FALSE)
}

Y1
DoIt(Y1)

Y2
DoIt(Y2)

Y3
DoIt(Y3)
