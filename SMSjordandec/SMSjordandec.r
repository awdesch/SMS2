# ----------------------------------------------------------------------------
#  Book:        Multivariate Statistics: Exercises and Solutions Series 
# ----------------------------------------------------------------------------
#  Quantlet:    SMSjordandec
# ----------------------------------------------------------------------------
#  Description: SMSjordandec performs a Jordan decomposition of a symmetric 
#               (3 x 3) matrix using its eigenvalues and eigenvectors.
# ----------------------------------------------------------------------------
#  Usage:       -
# ----------------------------------------------------------------------------
#  Keywords:    spectral decomposition, eigenvalues, eigenvectors,
#               decomposition, eigenvalue decomposition
# ----------------------------------------------------------------------------
#  See also:    SMSellipse, SMSjordandec
# ----------------------------------------------------------------------------
#  Author:      Dana Chromikova
# ----------------------------------------------------------------------------


# clear variables and close windows
rm(list=ls(all=TRUE))
graphics.off()

# main calculation
A      = cbind(c(1,2,3),c(2,1,2),c(3,2,1))   # matrix A
u      = eigen(A)                            # eigenvalues and eigenvectors of A
gama   = u$vec                               # matrix of eigenvectors
gama
lambda = diag(u$val)                         # diagonal matrix containing the eigenvalues
lambda
gama%*%lambda%*%t(gama)                      # Jordan decomposition
