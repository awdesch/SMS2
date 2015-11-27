

x=c(2,3,4,2.8,3)
xx=c(1.5,2,1.5,2,2.2)
y=1:5
plot(y~y,xlab="Treatment",ylab="Mean",main="Population profiles",type="n")
lines(x,col="red")
lines(xx,col="blue")
text(4.3,3.05,"Group1",col="red")
text(4.5,2.3,"Group2",col="blue")
