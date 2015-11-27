 # clear variables, close windows
rm(list=ls(all=TRUE))
graphics.off()

 # install packages | open library

# install and load packages
libraries = c("glmnet")
lapply(libraries, function(x) if (!(x %in% installed.packages())) {
  install.packages(x)
})
lapply(libraries, library, quietly = TRUE, character.only = TRUE)

# setwd("C:/...") # set working directory
 # load data set
load('carc.rda')

 # convert factors to numeric
carc$R78        = as.numeric(as.character(carc$R78))
carc$R77        = as.numeric(as.character(carc$R77))
carc$C.EU       = as.numeric(carc$C=="Europe")
carc$C          = as.numeric(carc$C=="US")
names(carc)[13] = "C.US"

y     = as.numeric(carc$P>6000)
x     = as.matrix(carc[,-1])

 # delete missing values
keep  =! is.na(apply(x,1,sum))
y     = y[keep]
x     = x[keep,]
labs  = colnames(x)

 # perform logit regression
res   = glmnet(x,y,family="binomial")

 # cross validation
cv.res    = cv.glmnet(x,y,family="binomial",nfolds=nrow(x),grouped=FALSE)
cv.lambda = cv.res$lambda.min # leave-one-out CV

 
layout(matrix(c(1,2), 2, 1),heights=c(0.6,0.4))

 # plot LASSO
matplot(log(res$lambda),t(res$beta),type="l",xlab=expression(log(lambda)),ylab="coefficients",main="logistic regression lasso for car data set",xlim=c(-11.5,-1.8))
text(cbind(-11,(res$beta[,100])),labs,adj=0,pos=2)
abline(v=log(cv.lambda),lty=2)

 # CV
plot(cv.res,ylab="binomial deviance",xlab=expression(log(lambda)),xlim=c(-11.5,-1.8))

res2 = glmnet(x,y,family="binomial",lambda=cv.lambda)

#                s0
# M    -0.050983693
# R78   .          
# R77   .          
# H    -0.221051891
# R     0.106341322
# Tr    .          
# W     0.002442590
# L     .          
# T     .          
# D     0.006945569
# G     .          
# C.US -3.987223235
# C.EU  2.095450692

data=data.frame(y,x)

# general linear model: logit
summary(glm(y~.,data=data,family="binomial"))

# Warning messages:
# 1: glm.fit: algorithm did not converge 
# 2: glm.fit: fitted probabilities numerically 0 or 1 occurred 

summary(glm(y~M+H+R+W+D+C.US+C.EU,family="binomial",data=data))

# Coefficients:
#               Estimate Std. Error z value Pr(>|z|)   
# (Intercept) -20.588580   8.986429  -2.291  0.02196 * 
# M            -0.037045   0.133031  -0.278  0.78065   
# H            -0.958662   0.913593  -1.049  0.29403   
# R             0.213218   0.239461   0.890  0.37325   
# W             0.006820   0.003194   2.135  0.03273 * 
# D             0.006069   0.015697   0.387  0.69902   
# C.US         -9.225817   3.143921  -2.934  0.00334 **
# C.EU          3.710133   2.067920   1.794  0.07279 . 
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
