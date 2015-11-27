
# clear variables and close windows
rm(list=ls(all=TRUE))
graphics.off()

# load data
load("carc.rda")

carc=carc[,c("M","W","D","C","P")]
names(carc)=c("Mileage","Weight","Displacement","Origin","Price")

attach(carc)
opar=par(mfrow=c(2,2))
plot(log(Mileage)~log(Weight))
plot(log(Mileage)~log(Displacement))
plot(log(Mileage)~Origin)
plot(log(Displacement)~log(Weight))

# large displacement with small weight:
#> identify(log(Displacement)~log(Weight))
#[1] 10 17
#               Mileage Weight Displacement Origin Price
#Buick_Opel          26   2230          304     US  4453
#Chev._Chevette      29   2110          231     US  3299

# reasonable model...
summary(lm1<-lm(log(Mileage)~log(Weight)+log(Displacement)+Origin))
# model without origin
lm2<-lm(log(Mileage)~log(Weight)+log(Displacement))
# test whether origin is significant
anova(lm1,lm2)

#summary(lm3o<-lm(Mileage~(Weight+I(Weight^2)+Origin)^2))
#lm3<-lm(Mileage~(Weight+I(Weight^2)+Origin))
#anova(lm3,lm3o)
dev.new()

plot(lm1)

# the outlier:
carc[71,]
#                 Mileage Weight Displacement Origin Price
#VW_Rabbit_Diesel      41   2040           90 Europe  5397
# other suspicious observations:
# carc[c(16,46),]
#             Mileage Weight Displacement Origin Price
#Cad._Seville      21   4290          350     US 15906
#Olds._98          21   4060          350     US  8814

summary(lm3<-lm(log(Mileage)~log(Weight)+Origin))

## interaction is not significant
#summary(lm3.int<-lm(log(Mileage)~(log(Weight)+Origin)^2))
#anova(lm3,lm3.int)
dev.new()
par(mfrow=c(1,1))
plot(log(Mileage)~log(Weight),pch=as.numeric(Origin)-(Origin=="US")-2*(Origin=="Europe"),col=as.numeric(Origin)+1)
oo=order(carc$Weight)
c3=coef(lm3)
abline(c(c3[1],c3[2]),col=2) # US
abline(c(c3[1]+c3[3],c3[2]),col=3,lty=2) # Japan
abline(c(c3[1]+c3[4],c3[2]),col=4,lty=3) # Europe

par(opar)
detach(carc)
