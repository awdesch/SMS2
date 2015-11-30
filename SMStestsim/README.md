[<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/banner.png" alt="Visit QuantNet">](http://quantlet.de/index.php?p=info)

## [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **SMStestsim** [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/d3/ia)


```yaml
Name of Quantlet: SMStestsim

Published in: Multivariate Statistics: Exercises and Solutions Series 

Description: 'Simulates a normal sample with [mu1,mu2]=[1, 2] and [sigma1, sigma2, sigma3, sigma4]=[1, 0.5, 0.5, 2] and tests the hypothesis H0: 2*mu1-mu2 = 0.2 for the cases a) sigma known and b) sigma unknown.'

Keywords: 'Covariance test, hypothesis-testing, Testing, simulation, empirical, covariance, covariance matrix, multivariate'

Keywords[new]: 'treatment'

See also: 'SMSanovapull, SMSdete2pull, SMSdeterpull, SMSlinregpull, SMSscabank45, SMScovbank'

Author[r]:   Jaroslav Pazdera
Author[m]:   Awdesch Melzer

Example: 'test statistic if covariance known
0.1620
 
 critical value if covariance known
3.8415
 
 test statistic if covariance unknown
0.1699
 
 critical value if covariance unknown
3.9371'

```

```R
# clear variables, close windows
rm(list=ls(all=TRUE))
graphics.off()

# set pseudo random numbers
set.seed(1)

p    = 2
n    = 100    # number of observations
u    = c(1,2) # mean
u

covMatrix = matrix(c(1,0.5,0.5,2),ncol=2) # covariance matrix
covMatrix

standardNormal = matrix(rnorm(n*p),nrow=p)
standardNormal

# eigenvectors and eigenvalues
evec = eigen(covMatrix,symmetric=TRUE)$vectors
eval = eigen(covMatrix,symmetric=TRUE)$values

covMatrix12 = evec%*%diag(sqrt(eval))%*%t(evec)
covMatrix12

X    = covMatrix12%*%standardNormal+u
X
A    = t(c(2,-1))
A
a    = 0.2
a
xBar = apply(X,1,mean)
xBar
# test statistic
test1= n*(A%*%xBar-a)*solve(A%*%covMatrix%*%t(A))*(A%*%xBar-a)
test1
# critical value
critval1 = qchisq(0.95,1)
critval1

S    = cov(t(X))
# test statistic
test2= (n-1)*(A%*%xBar-a)*solve(A%*%S%*%t(A))*(A%*%xBar-a)
test2
# critical value
critval2 = qf(0.95,1,n-1)
critval2


```
