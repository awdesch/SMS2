graphics.off()
rm(list=ls(all=TRUE))

# setwd("C:/...") # please change working directory
load("carmean2.rda")

x     = as.matrix(carmean2[,c(4,3,1:2,5:8)]);  # reorder: price value econ serv design sport safe easy
xrows = c("audi","bmw","citroen","ferrari",
            "fiat","ford","hyundai","jaguar",
            "lada","mazda","mercedes","mitsubishi",
            "nissan","opel_corsa","opel_vectra",
            "peugeot","renault","rover","toyota",
            "trabant","vw_golf","vw_passat","wartburg"
            );
s     = cov(x);                      # covariance
sa    = s[1:2,1:2];                  # covariance of price & value
sb    = s[3:8,3:8];                  # covariance of rest
temp  = eigen(sa);                   # spectral decomposition 
ea    = temp$values;
va    = temp$vectors;
temp  = eigen(sb);                   # spectral decomposition 
eb    = temp$values;
vb    = temp$vectors;
sa2   = va %*% diag(1/sqrt(ea)) %*% t(va);  # sa^(-1/2)
sb2   = vb %*% diag(1/sqrt(eb)) %*% t(vb);  # sb^(-1/2)
k     = sa2 %*% s[1:2,3:8] %*% sb2;           # matrix k
temp  = svd(t(k));                   # singular value decomposition
l     = temp$d;
d     = -temp$u;
g     = -temp$v;
a     = sa2 %*% g;                   # canonical vectors a
b     = sb2 %*% d;                   # canonical vectors b
a[,2] = a[,2]*(-1)
b[,2] = b[,2]*(-1)
print("second pair of canonical vectors")
print(a[,2])
print(b[,2])
eta   = x[,1:2] %*% a[,2];           # second canonical variable eta 
phi   = x[,3:8] %*% b[,2];           # second canonical variable phi 
etaphi= cbind(eta,phi);
plot(etaphi,type = "n", main = "car marks", xlab = expression(eta[2]), ylab = expression(varphi[2]));
text(etaphi,xrows,xpd=NA);           # adding labels to points
