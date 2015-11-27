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
