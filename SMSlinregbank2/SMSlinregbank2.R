# ---------------------------------------------------------------------
# Book:         SMS(2)
# ---------------------------------------------------------------------
# Quantlet:     SMSlinregbank2
# --------------------------------------------------------------------
# Description:  SMSlinregbank2 computes a linear regression for length 
#               of diagonal of counterfeit bank notes (bank2.dat).
# ---------------------------------------------------------------------
# Usage:        -
# ---------------------------------------------------------------------
# Inputs:       bank2.dat
# ---------------------------------------------------------------------
# Output:       linear regression for length of diagonal of counterfeit
#               bank notes (bank2.dat).
# ---------------------------------------------------------------------
# Example:      7.19
# ---------------------------------------------------------------------
# Results:
# model1 =
#
#
# Linear regression model:
# Call:
# lm(formula = Diagonal ~ ., data = bank2, subset = 101:200)
#
# Residuals:
#      Min       1Q   Median       3Q      Max 
# -1.16606 -0.28914 -0.01916  0.31843  1.21257 
#
# Coefficients:
#                     Estimate Std. Error t value Pr(>|t|)    
# (Intercept)         47.34541   34.93498   1.355  0.17859    
# Length               0.31930    0.14831   2.153  0.03388 *  
# `Height Left`       -0.50683    0.24829  -2.041  0.04403 *  
# `Height Right`       0.63375    0.20208   3.136  0.00229 ** 
# `Inner Frame Lower`  0.33250    0.05963   5.576 2.35e-07 ***
# `Inner Frame Upper`  0.31793    0.10391   3.060  0.00289 ** 
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#
# Residual standard error: 0.4714 on 94 degrees of freedom
# Multiple R-squared:  0.322,	Adjusted R-squared:  0.2859 
# F-statistic: 8.927 on 5 and 94 DF,  p-value: 5.757e-07
# ---------------------------------------------------------------------
# Keywords:    linear model, linear regression, least squares, R-squared
# ---------------------------------------------------------------------
# See also:    SMSlinregbank2, SMSlinregvocab, SMSprofil, SMSprofplasma,
#              SMStestcov, SMStestcov4i, SMStestcovwais, SMStestsim,
#              SMStestuscomp
# ---------------------------------------------------------------------
# Author:       Zdenek Hlavka
# ---------------------------------------------------------------------

# clear variables and close windows
rm(list=ls(all=TRUE))
graphics.off()

# setwd("C:/...") # set working directory
load("bank2.rda")

model1=lm(Diagonal~.,data=bank2,subset=101:200)
summary(model1)
