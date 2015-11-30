[<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/banner.png" alt="Visit QuantNet">](http://quantlet.de/index.php?p=info)

## [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **SMStestuscomp** [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/d3/ia)


```yaml
Name of Quantlet: SMStestuscomp 

Published in: Multivariate Statistics: Exercises and Solutions Series  

Description: 'Tests the equality of multivariate means for US companies. See Exercise 7.8' 

Keywords: 'Hotelling test, multivariate mean test, Testing, hypothesis-testing' 

See also: 'SMSlinregbank2, SMSlinregvocab, SMSprofil, SMSprofplasma, SMStestcov, SMStestcovwais, SMStestsim, SMStestuscomp' 

Author[r]:   Zdenek Hlavka 
Author[m]:   Awdesch Melzer 

Datafile[r]: uscomp.rda 
Datafile[m]: uscomp.txt 

 
Example: 'hotelling test results 
  test statistic
    2.1526
  
  degrees of freedom
    6       18
    
  p-value
    0.0970
  
  confidence interval for each variable 
         -7639        7193 
         -9613        4924 
         -2924        2103 
          -295         536 
          -527         791 
          -102          20' 

```

```R


# clear variables and close windows
rm(list=ls(all=TRUE))
graphics.off()

# install and load packages
libraries = c("Hotelling")
lapply(libraries, function(x) if (!(x %in% installed.packages())) {
  install.packages(x)
})
lapply(libraries, library, quietly = TRUE, character.only = TRUE)

# setwd("C:/...") # please set your working directory
load('uscomp.rda')

#uscomp2=uscomp[is.element(uscomp$Sector,c("Energy","Manufacturing")),]
tmp          = as.character(uscomp$Sales)
tmp[65]      = "1601" # clean data error
uscomp$Sales = as.numeric(tmp)

x1           = uscomp[uscomp$Sector=="Energy",1:6]
x2           = uscomp[uscomp$Sector=="Manufacturing",1:6]

ht           = hotelling.test(x1,x2)
print(ht)

n1           = 15
n2           = 10
n            = n1+n2
p            = 6

x1m          = sapply(x1,mean)
x2m          = sapply(x2,mean)

s            = ((n1-1)*var(x1)+(n2-1)*var(x2))/n
sjj          = diag(s)

t            = sqrt(p*n^2/(n1*n2*(n-p-1))*qf(0.95,p,n-p-1)*sjj)
as.matrix(paste( "(",round(x1m-x2m-t),", ",round(x1m-x2m+t),")",sep=""),ncol=1)

```
