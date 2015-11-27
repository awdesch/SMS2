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