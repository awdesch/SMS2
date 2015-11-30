

[<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/banner.png" alt="Visit QuantNet">](http://quantlet.de/index.php?p=info)

## [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **SMSjordandec** [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/d3/ia)


```yaml

Name of Quantlet: SMSjordandec

Published in: Multivariate Statistics: Exercises and Solutions

Description: 'Performs a Jordan decomposition of a symmetric (3 x 3) matrix using its eigenvalues and eigenvectors.'

Keywords: spectral decomposition, eigenvalues, eigenvectors, decomposition, eigenvalue decomposition

See also: 'SMSellipse, SMSjordandec'

Author[r]: Dana Chromikova
Author[m]: Dana Chromikova, Awdesch Melzer
```

```R
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

```
