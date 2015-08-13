#---------------------------------------------------------------------
# Book:         SMS
# ---------------------------------------------------------------------
# Quantlet:     SMScovbank 
# ---------------------------------------------------------------------
# Description:  SMScovbank calculates the covariance matrix
#               (and eigevalues) of the bank2 dataset (bank2.rda)
# ---------------------------------------------------------------------
# Usage:        -
# ---------------------------------------------------------------------
# See also:     SMSanovapull, SMScovbank, SMSdete2pull, SMSdeterpull,
#               SMSlinregpull, SMSscabank45
# ---------------------------------------------------------------------
# Keywords:     covariance, eigenvalues, spectral decomposition
# ---------------------------------------------------------------------
# Inputs:       None
# ---------------------------------------------------------------------
# Output:       covariance matrix (and eigevalues) of the bank2 dataset
#               (bank2.rda)
# ---------------------------------------------------------------------
# Example:      -
# ---------------------------------------------------------------------
# Author:       Dana Chromikova
# ---------------------------------------------------------------------

# clear variables and close windows
# rm(list=ls(all=TRUE))
# graphics.off()

# set working directory
# setwd("C:/...")

library(SMSdata)
data(bank2)
V = var(bank2)					#variance matrix
V
e = eigen(V)$val					#eigenvalues of V
e
a = rep(1,times=6)
v = var(as.matrix(bank2[101:200,])%*%a)		#the variance of the sum
v
