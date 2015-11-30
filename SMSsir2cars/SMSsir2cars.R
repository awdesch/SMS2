rm(list=ls(all=TRUE))
graphics.off()

# install and load packages
libraries = c("dr")
lapply(libraries, function(x) if (!(x %in% installed.packages())) {
    install.packages(x)})
lapply(libraries, library, quietly = TRUE, character.only = TRUE)

# setwd("C:/...") # set working directory
load("carc.rda")
m.text = row.names(carc)
n      = nrow(carc)
# get rid of the outliers
keep   = 1:n;
x      = carc[keep,c(2,(5:12))];
type   = as.numeric(carc[keep,13]);
y      = carc[keep,1];
t      = m.text[keep];
n      = nrow(x);
# x=log(x-min(x)+(max(x)-min(x))/200)

x      = scale(x);

temp   = dr(y~x, method="save", nslices = 10);
print(temp);

f      = temp$evectors;
g      = temp$evalues;

sg     = sum(g);
g      = as.vector(g/sg);
psi    = cumsum(g);
i      = 1:length(g);
ig     = cbind(i,g);
p11    = cbind(x %*% f[,1],y);
p12    = cbind(x %*% f[,2],y);
p21    = cbind(x %*% f[,3],y);
p123   = cbind(x %*% f[,1:2], y);

print("eigenvectors");
print(f);
print("eigenvalues and proportions");
print(cbind(g,cumsum(g)));
print(cbind(i,psi));

op     = par(mfrow = c(2,2));
type2  = type
type2[which(type==3)]=4

plot(p11, pch = type2, col = type+1, main = "", xlab = "1st projection", ylab = "price");
plot(p12, pch = type2, col = type+1, main = "", xlab = "2nd projection", ylab = "price");
plot(p21, pch = type2, col = type+1, main = "", xlab = "3rd projection", ylab = "price");
plot(ig, pch = "*", main = "SIR II scree plot", xlab = "k", ylab = " ", ylim = c(0,1));
points(cbind(i,psi));

# dev.new()
par(mfrow = c(1,1))
plot(p123, pch = type+21, col = type+1)
par(op)