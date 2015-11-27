# ---------------------------------------------------------------------
# Book:         SMS
# ---------------------------------------------------------------------
# Quantlet:     SMSlinregbank2
# ---------------------------------------------------------------------
# Description:  SMSlinregbank2 computes a linear regression for length 
#               of diagonal of counterfeit bank notes (bank2.rda).
# ---------------------------------------------------------------------
# Usage:        -
# ---------------------------------------------------------------------
# Inputs:       None
# ---------------------------------------------------------------------
# Output:       linear regression for length of diagonal of counterfeit
#               bank notes (bank2.rda).
# ---------------------------------------------------------------------
# Example:      
# ---------------------------------------------------------------------
# Author:       
# ---------------------------------------------------------------------

# clear variables, close windows
rm(list=ls(all=TRUE))
graphics.off()

load("bank2.rda")

model1 = lm(Diagonal~.,data=bank2,subset=101:200)
summary(model1)
