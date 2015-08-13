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
#               multivariate, multi dimensional, variance, transformation
# ---------------------------------------------------------------------
# Inputs:       None
# ---------------------------------------------------------------------
# Output:       covariance matrix (and eigevalues) of the transformed
#               counterfeit bank notes from bank2 dataset (bank2.rda)
# ---------------------------------------------------------------------
# Example:      -
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
v = var(as.matrix(bank2[101:200,])%*%a)   # the variance of the sum
v
