[<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/banner.png" alt="Visit QuantNet">](http://quantlet.de/index.php?p=info)

## [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) ** SMStestcov4i ** [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/d3/ia)


```yaml
Name of Quantlet: SMStestcov4i

Published in: Multivariate Statistics: Exercises and Solutions Series 

Description: 'Tests covariance matrices in Härdle & Simar (2015) Exercise 7.18'

Keywords: 'Covariance test, hypothesis-testing, Testing'

See also: 'SMSlinregbank2, SMSlinregvocab, SMSprofil, SMSprofplasma, SMStestcov, SMStestcovwais, SMStestsim, SMStestuscomp'

Author[r]:   Zdenek Hlavka
Author[m]:   Awdesch Melzer

Example: 'Part A
   Test statistic:
   182.2332 
   Critical Value:
    18.3070
 
 Part B
 Test statistic:
   179.5047
 Critical Value:
   18.3070'

```

```R
# clear variables and close windows
rm(list=ls(all=TRUE))
graphics.off()

## part A

s1      = matrix(c(
21.907 , 1.415 , -2.050 , 2.379,
1.415 , 11.853 , 2.104 , -1.864 ,
-2.050 , 2.104 , 17.230 , 0.905,
2.379 ,  -1.864 , 0.905 , 9.037
),ncol=4,nrow=4)

s0      = matrix(c(
4,0,0,0,
0,4,0,0,
0,0,4,0,
0,0,0,4
),ncol=4,nrow=4)

s01     = diag(1/diag(s0)) # only because it is diagonal
n       = 30               # population size
tst     = n*sum(diag(s01%*%s1))-n*log(det(s01%*%s1))-n*4 # test statistic
crt.val = qchisq(0.95,10)  # crititcal value

print(tst)
print(crt.val)

## part B

s1      = matrix(c(
14.649 , -0.024 , 1.248 , -3.961,
-0.024 , 15.825 , 0.746 , 4.301,
1.248 , 0.746 , 9.446 , 1.241,
-3.961 , 4.301 , 1.241 , 20.002
),ncol=4,nrow=4)

tst     = n*sum(diag(s01%*%s1))-n*log(det(s01%*%s1))-n*4 # test statistic
crt.val = qchisq(0.95,10) # crititcal value

print(tst)
print(crt.val)


```
