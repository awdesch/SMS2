

[<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/banner.png" alt="Visit QuantNet">](http://quantlet.de/index.php?p=info)

## [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **SMStestcov** [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/d3/ia)


```yaml
Name of Quantlet: SMStestcov

Published in: Multivariate Statistics: Exercises and Solutions Series 

Description: 'Tests equality of matrices in Härdle, Simar, Exercise 7.13'

Keywords: 'Covariance test, hypothesis-testing, Testing' 

See also: 'SMSlinregbank2, SMSlinregvocab, SMSprofil, SMSprofplasma, SMStestcov4i, SMStestcovwais, SMStestsim, SMStestuscomp'

Author[r]:   Zdenek Hlavka
Author[m]:   Awdesch Melzer

Example: 'Test statistic and critical value      
     Part A
     6.6945
 
    18.3070
 
     Part B
    21.6933
 
    18.3070
 
     Part C
    13.1754
 
    18.3070'


```

```R
# clear memory, close windows
rm(list=ls(all=TRUE))
graphics.off()

## part A

s1=matrix(c(
0.812,-0.229,-0.034,0.073,
-0.229,1.001,0.010,-0.059,
-0.034,0.010,1.078,-0.098,
0.073,-0.059,-0.098,0.823
),ncol=4,nrow=4)

s2=matrix(c(
0.559,-0.057,-0.271,0.306,
-0.057,1.237,0.181,0.021,
-0.271,0.181,1.159,-0.130,
0.306,0.021,-0.130,0.683
),ncol=4,nrow=4)

n1=30
n2=20
n=n1+n2

s=(n1*s1+n2*s2)/n

tst=n*log(det(s))-n1*log(det(s1))-n2*log(det(s2))
crt.val=qchisq(0.95,10)

print(tst)
print(crt.val)

## part B

s1=matrix(c(
21.907 , 1.415 , -2.050 , 2.379,
1.415 , 11.853 , 2.104 , -1.864 ,
-2.050 , 2.104 , 17.230 , 0.905,
2.379 ,  -1.864 , 0.905 , 9.037
),ncol=4,nrow=4)

s2=matrix(c(
20.349 , -9.463 , 0.958 , -6.507 ,
-9.463 , 15.502 , -3.383 , -2.551,
0.958 , -3.383 , 14.470 , -0.323,
-6.507 , -2.551 , -0.323 , 10.311
),ncol=4,nrow=4)

n1=30
n2=20
n=n1+n2

s=(n1*s1+n2*s2)/n

tst=n*log(det(s))-n1*log(det(s1))-n2*log(det(s2))
crt.val=qchisq(0.95,10)

print(tst)
print(crt.val)

## part C

s1=matrix(c(
14.649 , -0.024 , 1.248 , -3.961,
-0.024 , 15.825 , 0.746 , 4.301,
1.248 , 0.746 , 9.446 , 1.241,
-3.961 , 4.301 , 1.241 , 20.002
),ncol=4,nrow=4)

s2=matrix(c(
14.035 , -2.372 , 5.596 , -1.601,
-2.372 , 9.173 , -2.027 , -2.954,
5.596 , -2.027 , 9.021 , -1.301,
-1.601 , -2.954 , -1.301 , 9.593
),ncol=4,nrow=4)

n1=30
n2=20
n=n1+n2

s=(n1*s1+n2*s2)/n

tst=n*log(det(s))-n1*log(det(s1))-n2*log(det(s2))
crt.val=qchisq(0.95,10)

print(tst)
print(crt.val)


```
