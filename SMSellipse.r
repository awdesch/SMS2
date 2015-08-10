# ---------------------------------------------------------------------
# Book:         SMS
# ---------------------------------------------------------------------
# Quantlet:     SMSellipse
# ---------------------------------------------------------------------
# Description:  SMSellipse computes ellipsoids for varying rho and d. rho
#               is the direction and correlation parameter lying between -1 and 1. d
#               is the radius of the ellipsoids. Given a covariance 
#               structure Sigma, depending on rho, the ellipse function
#               calculates the cholesky decomposition of Sigma = Q'*Q,
#               resulting in a upper triangular matrix Q, which in turn
#               is used for the transformation of the unit circle with
#               respect to the direction. The shape of the ellipsoids
#               is in accordance with the correlation parameter rho.
# ---------------------------------------------------------------------
# See also:     SMSellipse, SMSjordandec
# ---------------------------------------------------------------------
# Keywords:     ellipse, correlation, plot, covariance matrix,
#               Cholesky decomposition
# ---------------------------------------------------------------------
# Usage:        -
# ---------------------------------------------------------------------
# Inputs:       None
# ---------------------------------------------------------------------
# Output:       Plots of four ellipsoids.
# ---------------------------------------------------------------------
# Example:      Ellipsoids for rho = c(0.5, -0.75, 0, 0.25) and 
#               radius = c(4, 4, 4, 1) are plotted.
# ---------------------------------------------------------------------
# Autor:        Monika Jakubcova
#----------------------------------------------------------------------

# clear variables and close windows
rm(list=ls(all=TRUE))
graphics.off()

# setwd(Sys.glob("~/downloads/")) # set your working directory

# install and load packages
libraries = c("car")
lapply(libraries, function(x) if (!(x %in% installed.packages())) {
  install.packages(x)
})
lapply(libraries, library, quietly = TRUE, character.only = TRUE)

#help.search("ellipse", "input")

rhovec  = c(0.5,-0.75,0,0.25)  # direction
dvec    = c(4,4,4,1)           # radius
par(mfrow=c(2,2))
for (i in 1:4) {
    r   = rhovec[i]
    d   = dvec[i]
    c   = c(0,0)
    c1  = c(1,r)
    c2  = c(r,1)
    sha = cbind(c1,c2)         # covariance matrix used for the cholesky decomposition within the ellipse function
    plot(cbind(c(d,-d),c(d,-d)),type="n",xlab="", ylab="", main=substitute(list(d==d1,  rho==r1), list(d1=d,r1=sprintf("%0.2f",r))))
    ellipse(c,sha,d, center.pch=20, center.cex=1, segments=51, add=TRUE, col="black", lwd=1, lty=1)
}
