graphics.off()
rm(list=ls(all=TRUE))

# setwd("C:/...") # change working directory
load("carc.rda")
reg    = as.numeric(carc[,13])
x      = carc[,2]
x      = 2.352*100/x   #litres per 100 km  instead miles per gallon
n      = length(x)

#percentage of regions; estimates apriori probabilities
pi1    = sum(reg==1)/n
pi2    = sum(reg==2)/n
pi3    = 1-pi1-pi2

 #separating data by region
x1     = x[reg==1]
x2     = x[reg==2]
x3     = x[reg==3]

 #means of groups by region
m1     = mean(x1)            
m2     = mean(x2)   
m3     = mean(x3) 
 #common means
m12    = (m1+m2)/2 
m23    = (m2+m3)/2    
m13    = (m1+m3)/2  

 #common variance
s      = ((length(x1)-1)*var(x1)+(length(x2)-1)*var(x2)+(length(x3)-1)*var(x3))/(length(x)-3)    
 
 #allocating regions (1,2,3) to data with the Bayes rule 
alloc1 = 1*((x-m12)*solve(s)*(m1-m2)>log(pi2/pi1))*((x-m13)*solve(s)*(m1-m3)>log(pi3/pi1))
alloc2 = 2*((x-m12)*solve(s)*(m2-m1)>log(pi1/pi2))*((x-m23)*solve(s)*(m2-m3)>log(pi3/pi2))
alloc3 = 3*((x-m13)*solve(s)*(m3-m1)>log(pi1/pi3))*((x-m23)*solve(s)*(m3-m2)>log(pi2/pi3))

 #sorting rules
rule12 = m12+log(pi2/pi1)/(solve(s)*(m1-m2))
rule23 = m23+log(pi3/pi2)/(solve(s)*(m2-m3))
rule13 = m13+log(pi3/pi1)/(solve(s)*(m1-m3))

alloc  = alloc1+alloc2+alloc3   #vector with elements (1,2,3)

aper   = 1-sum(reg==alloc)/n     #percent of incorrectly sorted data

mist   = (alloc!=reg)            #position of sorting mistakes

par(mar=c(0,0,0,0))
 #plot of sorted data; full symbols - data sorted into the wrong category
plot(x,(reg+0.1*rnorm(n,0,1)),col=(reg+2),pch=(reg-1+mist*15),xlim=c(min(rule12,rule13,rule23),max(x)),axes=FALSE,ann=FALSE)
 #lines showing the sorting rules
lines(c(rule12,rule12),c(0.8,2.2),lwd=2)
lines(c(rule23,rule23),c(1.8,3.2),lwd=2)
lines(c(rule13,rule13),c(0.8,3.2),lwd=2)

print("aper")
print(aper)
