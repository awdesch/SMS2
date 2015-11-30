# Clear workspace
graphics.off()
rm(list=ls(all=TRUE))

# setwd("C:/...") # change working directory
load("carmean2.rda")

x = as.matrix(carmean2[,c(4,1,8)]);  # reorder: price econ easy
xrows = c("audi","bmw","citroen","ferrari",
            "fiat","ford","hyundai","jaguar",
            "lada","mazda","mercedes","mitsubishi",
            "nissan","opel_corsa","opel_vectra",
            "peugeot","renault","rover","toyota",
            "trabant","vw_golf","vw_passat","wartburg"
            );
s    = cov(x);                  # covariance 
sa   = s[1,1];                  # variance of price
sb   = s[2:3,2:3];              # covariance of rest
temp = eigen(sa);               # spectral decomposition 
ea   = temp$values;
va   = temp$vectors;
temp = eigen(sb);               # spectral decomposition 
eb   = temp$values;
vb   = temp$vectors;
sa2  = as.matrix( va %*% (1/sqrt(ea)) %*% t(va));      # sa^(-1/2) - diag() doesn't work well for 1x1 "matrix"
sb2  = vb %*% diag(1/sqrt(eb)) %*% t(vb);  # sb^(-1/2)
k    = sa2 %*% s[1,2:3] %*% sb2;           # matrix k
temp = svd(t(k));                # singular value decomposition
l    = temp$d;
d    = -temp$u;
g    = -temp$v;
a    = sa2 %*% g;                # canonical vectors a
b    = sb2 %*% d;                # canonical vectors b
print("first pair of canonical vectors")
print(a[,1])
print(b[,1])
eta    = x[,1] %*% as.matrix(a[,1]);    # first canonical variable eta 
phi    = x[,2:3] %*% b[,1];             # first canonical variable phi 
etaphi = cbind(eta,phi);
plot(etaphi,type = "n", main = "subset of car marks", xlab = expression(eta), ylab = expression(varphi));
text(etaphi,xrows,xpd=NA);              # adding labels to points