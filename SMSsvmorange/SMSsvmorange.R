rm(list=ls(all=TRUE))
graphics.off()
  
# install and load packages
libraries = c("kernlab","tseries","quadprog","zoo")
lapply(libraries, function(x) if (!(x %in% installed.packages())) {
    install.packages(x)})
lapply(libraries, library, quietly = TRUE, character.only = TRUE)  
  
  # generation of ideal data set: Xp with covariance (4,0,0,4) and Xn with covariance (0.25,0,0,0.25) for groups x(1) and x(-1)
p       = 4   # number of plots
n       = 200 # number of observations
set.seed(2)
# generating 2-variate data, member of group x(1)
  
sigma.p = matrix(c(4,0,0,4),2,2)
  
Mp      = t(chol(sigma.p))  				# Cholesky square root
Zp      = matrix(rnorm(n),2,100)  			# 2 row, 50 columns
Xp      = t(Mp %*% Zp)
Xp1     = Xp[,1]
Xp2     = Xp[,2]
  
  # generating 2-variate data, member of group x(-1)
  
sigma.n = matrix(c(0.25,0,0,0.25),2,2)
  
Mn      = t(chol(sigma.n))  				# Cholesky square root
Zn      = matrix(rnorm(n),2,100)  			# 2 row, 50 columns
Xn      = t(Mn %*% Zn)
Xn1     = Xn[,1]
Xn2     = Xn[,2]
  
  # Aggregating data
  
  X1      = c(Xp1,Xn1)
  X2      = c(Xp2,Xn2)
  
  # generating indicator variable
  
yp      = rep(1,n/2)
yn      = rep(-1,n/2)
  
Y       = c(yp,yn)
OP      = cbind(X2, X1)
  
## Main program of SVM classification plot
  
sgm = c(0.2,5,0.2,5)	# parameter r in anisotropic gaussian kernel
C = c(0.1,0.1,8,8)

for (i in 1:p){ 
  OrangePeelModel = ksvm(OP, Y, type="C-svc", kernel="rbfdot", kpar=list(sigma=sgm[i]), C=C[i], prob.model=TRUE, cross=4)
  str = paste("s=",sprintf("%0.1f",sgm[i]),", c=",sprintf("%0.1f",C[i]),"                          ",sep="")
  plot(OrangePeelModel, data=OP,cex=0.7,cex.main=1.5)
  title(sub=str)
  print(OrangePeelModel)
  }

