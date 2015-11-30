

[<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/banner.png" alt="Visit QuantNet">](http://quantlet.de/index.php?p=info)

## [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **SMSlinregbank2** [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/d3/ia)


```yaml
Name of Quantlet: SMSlinregbank2

Published in: Multivariate Statistics: Exercises and Solutions Series 

Description: 'Computes a linear regression for length of diagonal of counterfeit bank notes'

Keywords: 'linear model, linear regression, least squares, R-squared, summary'

See also: 'SMSlinregbank2, SMSlinregvocab, SMSprofil, SMSprofplasma, SMStestcov, SMStestcov4i, SMStestcovwais, SMStestsim, SMStestuscomp'

Author[r]:   Zdenek Hlavka
Author[m]:   Philipp Jackmuth

Datafile[r]: bank2.rda
Datafile[m]: bank2.dat

Output: 'Exercise 7.19 from SMS2 book: linear regression for length of diagonal of counterfeit bank notes.'

Example[r]: 'model1 =


 Linear regression model:
 Call:
 lm(formula = Diagonal ~ ., data = bank2, subset = 101:200)

 Residuals:
      Min       1Q   Median       3Q      Max 
 -1.16606 -0.28914 -0.01916  0.31843  1.21257 

 Coefficients:
                     Estimate Std. Error t value Pr(>|t|)    
 (Intercept)         47.34541   34.93498   1.355  0.17859    
 Length               0.31930    0.14831   2.153  0.03388 *  
 `Height Left`       -0.50683    0.24829  -2.041  0.04403 *  
 `Height Right`       0.63375    0.20208   3.136  0.00229 ** 
 `Inner Frame Lower`  0.33250    0.05963   5.576 2.35e-07 ***
 `Inner Frame Upper`  0.31793    0.10391   3.060  0.00289 ** 
 ---
 Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

 Residual standard error: 0.4714 on 94 degrees of freedom
 Multiple R-squared:  0.322,	Adjusted R-squared:  0.2859 
 F-statistic: 8.927 on 5 and 94 DF,  p-value: 5.757e-07'

Example[m]: ' md1 =


 Linear regression model:
 y ~ 1 + x1 + x2 + x3 + x4 + x5

 Estimated Coefficients:
 Estimate    SE          tStat      pValue
 (Intercept)      47.345      34.935     1.3552       0.17859
 x1               0.3193     0.14831      2.153      0.033879
 x2             -0.50683     0.24829    -2.0412       0.04403
 x3              0.63375     0.20208     3.1361     0.0022856
 x4               0.3325    0.059634     5.5757    2.3528e-07
 x5              0.31793     0.10391     3.0598     0.0028866


 Number of observations: 100, Error degrees of freedom: 94
 Root Mean Squared Error: 0.471
 R-squared: 0.322,  Adjusted R-Squared 0.286
 F-statistic vs. constant model: 8.93, p-value = 5.76e-07'

```

```R
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

```
