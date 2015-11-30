# clear variables and close windows
rm(list=ls(all=TRUE))
graphics.off()

y1  = c(1,2,4,3,6,5)
y2  = c(1,3,4,2,5,6)
y3  = c(3,1,5,2,6,4)
y   = c(y1,y2,y3)

x1  = cbind(1,c(0,0,1,1,0,0),c(0,0,0,0,1,1),c(0,1,0,1,0,1))
x   = rbind(x1,x1,x1)

cat("n SUMMARY lm(y~x-1)n")
print(summary(lm(y~x-1)))
z1  = as.vector(cbind(y1[1:2],y2[1:2],y3[1:2]))
z2  = as.vector(cbind(y1[3:4],y2[3:4],y3[3:4]))
z3  = as.vector(cbind(y1[5:6],y2[5:6],y3[5:6]))
z   = cbind(z1,z2,z3)
lmz = lm(z3~z1+z2)
cat("n ANOVA lm(z3~z1+z2) nn")
print(anova(lmz))