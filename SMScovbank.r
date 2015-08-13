#---------------------------------------------------------------------
# Book:         SMS
# ---------------------------------------------------------------------
# Quantlet:     SMScovbank 
# ---------------------------------------------------------------------
# Description:  It calculates the covariance matrix
#               (and eigevalues) of the counterfeit bank notes
#               (observations 101-200) from the bank2 dataset (bank2.rda)
#               after they were lineary transformed by a vector
#               a = (1, 1, 1, 1, 1, 1)'.
# ---------------------------------------------------------------------
# Usage:        -
# ---------------------------------------------------------------------
# See also:     SMSanovapull, SMScovbank, SMSdete2pull, SMSdeterpull,
#               SMSlinregpull, SMSscabank45
# ---------------------------------------------------------------------
# Keywords:     covariance, eigenvalues, spectral decomposition,
#               multivariate, multi dimensional, variance, transformation,
#               decomposition, eigenvalue decomposition
# ---------------------------------------------------------------------
# Inputs:       None
# ---------------------------------------------------------------------
# Output:       covariance matrix (and eigevalues) of the transformed
#               counterfeit bank notes from bank2 dataset (bank2.rda)
# ---------------------------------------------------------------------
# Example:
#
# Covariance matrix:
# round(cov(bank2),4)
#                    Length Height Left Height Right Inner Frame Lower Inner Frame Upper Diagonal
# Length             0.1418      0.0314       0.0231           -0.1032           -0.0185   0.0843
# Height Left        0.0314      0.1303       0.1084            0.2158            0.1050  -0.2093
# Height Right       0.0231      0.1084       0.1633            0.2841            0.1300  -0.2405
# Inner Frame Lower -0.1032      0.2158       0.2841            2.0869            0.1645  -1.0370
# Inner Frame Upper -0.0185      0.1050       0.1300            0.1645            0.6447  -0.5496
# Diagonal           0.0843     -0.2093      -0.2405           -1.0370           -0.5496   1.3277
#
# Eigenvalues:
# e
# 3.00030487 0.93562052 0.24341371 0.19465874 0.08521185 0.03551468
#
# Variance of the transformed (summed over rows) counterfeit bank notes
# v
# 1.742282
#
# ---------------------------------------------------------------------
# Author:       Dana Chromikova
# ---------------------------------------------------------------------

# clear variables and close windows
 rm(list=ls(all=TRUE))
 graphics.off()

# setwd("C:/...")                         # set working directory

load("bank2.rda")                         # load data

V = var(bank2)                            # variance matrix
V
e = eigen(V)$val                          # eigenvalues of V
e
a = rep(1,times=6)
v = var(as.matrix(bank2[101:200,])%*%a)   # the variance of the row sums
v
