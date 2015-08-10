# ---------------------------------------------------------------------
# Book:         SMS
# ---------------------------------------------------------------------
# Quantlet:     SMSellipse
# ---------------------------------------------------------------------
# Description:  SMSellipse computes ellipses for varying rho and d.
# ---------------------------------------------------------------------
# See also:     SMSellipse, SMSjordandec
# ---------------------------------------------------------------------
# Keywords:     ellipse, correlation
# ---------------------------------------------------------------------
# Usage:        -
# ---------------------------------------------------------------------
# Inputs:       None
# ---------------------------------------------------------------------
# Output:       Contour plot and hexagon plot of simulated multivariate
#               normal random numbers.
# ---------------------------------------------------------------------
# Example:      -
# ---------------------------------------------------------------------
# Autor:        Monika Jakubcova
#----------------------------------------------------------------------

#help.search("ellipse", "input")

library(car)

rhovec = c(0.5,-0.75,0,0.25)
dvec = c(4,4,4,1)

for (i in 1:4) {
    r = rhovec[i]
    d = dvec[i]
    c = c(0,0)
    n = 101
    c1 = c(1,r)
    c2 = c(r,1)
    sha = cbind(c1,c2)
    plot(cbind(c(d,-d),c(d,-d)),type="n",xlab="", ylab="", main=substitute(list(d==d1,  rho==r1), list(d1=d,r1=sprintf("%0.2f",r))))
    ellipse(c,sha,d, center.pch=20, center.cex=1, segments=51, add=TRUE, col="black", lwd=1, lty=1)
}
