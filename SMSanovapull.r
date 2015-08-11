#---------------------------------------------------------------------
# Book:         SMS
# ---------------------------------------------------------------------
# Quantlet:     SMSanovapull
# ---------------------------------------------------------------------
# Description:  SMSanovapull performes a linear regression and an analysis
#               of variance (ANOVA) for three marketing strategies.
#               A company decides to compare the effect of three marketing
#               strategies:
#               1. advertisement in local newspaper
#               2. presence of sales assistant
#               3. special presentation in shop windows,
#               on the sales of their portfolio in 30 shops.
#               The 30 shops were divided into 3 groups of 10 shops.
#               The sales using the strategies 1, 2, and 3 were
#               y1 = (9, 11, 10, 12, 7, 11, 12, 10, 11, 13)',
#               y2 = (10, 15, 11, 15, 15, 13, 7, 15, 13, 10)', and
#               y3 = (18, 14, 17, 9, 14, 17, 16, 14, 17, 15)', respectively. 
#               A null hypothesis of equality of means of the three groups
#               is tested. The standard approach of using ANOVA leads to
#               an F-test. The alternative proposition is to use a
#               linear factor model using the strategies as regression
#               variables to build curve that corresponds to the alternative
#               hypothesis of the ANOVA with three horizontal lines,
#               each for one strategy. The F-test of testing equality of
#               the coefficients to zero corresponds to the null of testing
#               the marketing strategies having no effect.
#               The output shows rejection of the null hypothesis.
#               For more information see Exercise 3.20.
# ---------------------------------------------------------------------
# Usage:        -
# ---------------------------------------------------------------------
# See also:     SMSanovapull, SMScovbank, SMSdete2pull, SMSdeterpull,
#               SMSlinregpull, SMSscabank45
# ---------------------------------------------------------------------
# Keywords:     anova, analysis of variance, factor-model, linear model,
#               variance, F-test, F-statistic, F test, mean,
#               heteroskedasticity, test, Testing
# ---------------------------------------------------------------------
# Inputs:       None
# ---------------------------------------------------------------------
# Output:       ANOVA table for Exercise 3.20.
# ---------------------------------------------------------------------
# Example:      
# Analysis of Variance Table
#
# anova(lm1)
# Analysis of Variance Table
#
# Response: y
#           Df Sum Sq Mean Sq F value   Pr(>F)   
# x          2  102.6  51.300  8.7831 0.001153 **
# Residuals 27  157.7   5.841                    
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#
#
# summary(lm1)
# Call:
# lm(formula = y ~ x)
#
# Residuals:
#    Min     1Q Median     3Q    Max 
#   -6.1   -1.1    0.4    1.9    2.9 
#
# Coefficients:
#           # Estimate Std. Error t value Pr(>|t|)    
# (Intercept)  10.6000     0.7642  13.870 8.44e-14 ***
# x2            1.8000     1.0808   1.665 0.107392    
# x3            4.5000     1.0808   4.164 0.000287 ***
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#
# Residual standard error: 2.417 on 27 degrees of freedom
# Multiple R-squared:  0.3942,	Adjusted R-squared:  0.3493 
# F-statistic: 8.783 on 2 and 27 DF,  p-value: 0.001153
#
# ---------------------------------------------------------------------
# Author:       Dana Chromikova
# ---------------------------------------------------------------------

# clear variables and close windows
rm(list=ls(all=TRUE))
graphics.off()

y   = c(9,11,10,12,7,11,12,10,11,13,10,15,11,15,15,13,7,15,13,10,18,14,17,9,14,17,16,14,17,15)
x   = factor(rep(1:3,each=10))   # factor variable for 3 strategies and 30 observations
lm1 = lm(y~x)                    # linear model

anova(lm1)                       # anova table
summary(lm1)                     # regression summary
