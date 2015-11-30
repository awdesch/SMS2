[<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/banner.png" alt="Visit QuantNet">](http://quantlet.de/index.php?p=info)

## [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **SMStestcovwais** [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/d3/ia)


```yaml
Name of Quantlet: SMStestcovwais

Published in: Multivariate Statistics: Exercises and Solutions Series 

Description: 'Tests equality of matrices in Härdle & Simar (2015), Exercise 7.14. Test of equal covariance matrices of 4 subtests of the Wechseler Adult Intelligence Scale (WAIS) for 2 categories of people. group 1: n1=37 without senile factor, group 2: n2=12 with senile factor.'

Keywords: 'Covariance test, hypothesis-testing, Testing'

Keywords[new]: 'treatment'

See also: 'SMSlinregbank2, SMSlinregvocab, SMSprofil, SMSprofplasma, SMStestcov4i, SMStestcovwais, SMStestsim, SMStestuscomp'

Author[r]:   Jakub Petrasek
Author[m]:   Dedy Dwi Prastyo, Awdesch Melzer 

Datafile[r]: wais.rda
Datafile[m]: wais.dat

Example: 'Equality test of matrices in Härdle, Simar, Exercise 7.14
test statistic
20.6578

critical value
18.3070'
```


```R
# clear variables and close windows
rm(list=ls(all=TRUE))
graphics.off()

# setwd("C:/....") # set working directory according to the data
load("wais.rda")

x1 = wais[1:12,3:6]
x2 = wais[13:49,3:6]

a  = cov(x1)*11/12  # covariance non-senile group
b  = cov(x2)*36/37  # covariance senile group

c  = (12*a+37*b)/49 # pooled covariance

print(test<-49*log(det(c))-12*log(det(a))-37*log(det(b))) #test statistic
print(crit<-qchisq(0.95,10))  #critical value
```
