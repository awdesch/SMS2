

[<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/banner.png" alt="Visit QuantNet">](http://quantlet.de/index.php?p=info)

## [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **SMSprofil** [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/d3/ia)


```yaml
Name of Quantlet: SMSprofil

Published in: Multivariate Statistics: Exercises and Solutions Series 

Description: 'Plots an example of population profiles to compare the effect of a treatment'

Keywords: 'profile, plot, data visualization, visualization, graphical representation'

Keywords[new]: 'treatment'

See also: 'SMSlinregbank2, SMSlinregvocab, SMSprofil, SMSprofplasma, SMStestcov, SMStestcov4i, SMStestcovwais, SMStestsim, SMStestuscomp'

Author[r]:   Barbora Lebduskova
Author[m]:   Awdesch Melzer

Example[r]: 'Plot of a treatment profile.'

Example[m]: 'Plot of a treatment profile.'
```


![Picture1](SMSprofil_r.png)


```R


x=c(2,3,4,2.8,3)
xx=c(1.5,2,1.5,2,2.2)
y=1:5
plot(y~y,xlab="Treatment",ylab="Mean",main="Population profiles",type="n")
lines(x,col="red")
lines(xx,col="blue")
text(4.3,3.05,"Group1",col="red")
text(4.5,2.3,"Group2",col="blue")

```
