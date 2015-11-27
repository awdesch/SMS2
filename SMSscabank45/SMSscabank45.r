# ---------------------------------------------------------------------
# Book:         SMS
# ---------------------------------------------------------------------
# Quantlet:     SMSscabank45
# ---------------------------------------------------------------------
# Description:  SMSscabank45 computes a two dimensional scatterplot of
#               X4 vs. X5 (upper inner frame vs. lower) of the Swiss
#               bank notes data (bank2.dat).
# ---------------------------------------------------------------------
# See also:     SMSanovapull, SMSdete2pull, SMSdeterpull, SMSlinregpull,
#               SMSscabank45, SMScovbank
# ---------------------------------------------------------------------
# Usage:        -
# ---------------------------------------------------------------------
# Keywords:     scatterplot, data visualization, graphical representation
# ---------------------------------------------------------------------
# Inputs:       None
# ---------------------------------------------------------------------
# Output:       Two dimensional scatterplot of X4 vs. X5 (upper inner
#               frame vs. lower) of the Swiss bank notes data
#               (bank2.dat).
# ---------------------------------------------------------------------
# Example:      -
# ---------------------------------------------------------------------
# Author:       Zdenek Hlavka
# ---------------------------------------------------------------------

# clear variables and close windows
rm(list=ls(all=TRUE))
graphics.off()

# set working directory
# setwd("C:/...")

# load data
load("bank2.rda")

# scatterplot
plot(bank2[,c(4,5)],main="Swiss bank notes",xlab=expression(X[4]),ylab=expression(X[5]))
