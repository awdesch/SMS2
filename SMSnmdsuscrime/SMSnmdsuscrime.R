rm(list=ls(all=TRUE))
graphics.off()

nonMDS = function(Dist){
 alpha = 0.2
 # calculate configuration of points in two dimensions

# define matrix A
 A = (as.matrix(Dist)^2)*(-0.5) 
 n = nrow(as.matrix(Dist))
# size of distance matrix
 nn = n^2
 
 I = diag(rep(1,n))
 u = matrix(1,n,1)
# define the centering matrix 
 H = I-(1/6*(u%*%t(u)))
# compute inner product matrix
 B = H%*%A%*%H
# compute eigenvalues and vectors, sorted by values 
 G = eigen(B)
 G1 = cbind(G$vectors[,1],G$vectors[,2])
 G2 = diag(G$values[1:2])
# compute point configuration in R^p
 X = G1%*%(G2^0.5)
 
 # X=normal(rows(Dist),2)
 pic0=X
 X1=X

 # iterate Shepard-Kruskal until convergence
 change = 1
 STRESS1 = 1
 iter = 0
 n = nrow(as.matrix(Dist))
 nn = n^2
 while ((change>1e-16)&&(iter<10000)){
# while (iter<0)
  iter = iter+1

  # isotonic regression
  Dist1 = cbind(matrix(as.matrix(dist(X,"euclidean",diag=T,upper=T)),nn,1),floor((0:(nn-1))/n+1))
  Dist1 = cbind(Dist1,((1:(nn))-(Dist1[,2]-1)*n))
  Dist1 = cbind(matrix(as.matrix(Dist),nn,1),Dist1)
  Dist1 = Dist1[order(Dist1[,1]),]
  DIST1 = cbind(Dist1[,1],Dist1[,2],Dist1[,4],Dist1[,3])
  Dist1 = DIST1
  Dist2 = isoreg(Dist1[,2])$yf

  STRESS0 = STRESS1
  STRESS1 = t(Dist2-Dist1[,1])%*%(Dist2-Dist1[,1])/(2*sum(Dist1[,1]^2))

  change = STRESS0 - STRESS1

  # update X
  Xnew = X
  Dist1 = cbind(Dist1, Dist2)

  Dist1 = Dist1[order(Dist1[,4],Dist1[,3]),]#,Dist1[,3])
  D = matrix(Dist1[,2],n,n)+I
  DH = matrix(Dist1[,5],n,n)+I
  shift = alpha*(1-(DH/D))/(n-1)
  i=0
  while (i<n){
   i=i+1 
   Xnew[i,] = X[i,] + apply(shift[,i]*(X-matrix(X[i,],nrow=50,2,byrow=T)),2,sum)
  }
 X = Xnew 


 }
 
 
  picl = X
  comsc = c(min(X[,1],X[,2],X1[,1],X1[,2]),max(X[,1],X[,2],X1[,1],X1[,2]))
  comra = (comsc[2]-comsc[1])/5
  comsc = comsc+c(-comra,comra)
  ym = floor(comra*2)

 return(list(X, pic0, picl))

}

load("uscrime.rda")
x = uscrime
text1 = row.names(uscrime)
col = x[,ncol(x)-1]
col = as.numeric(col)+c(rep(-1,37),rep(0,13))
for (i in 1:ncol(x)){
  x[,i] = as.numeric(x[,i]) 
}
x=scale(x)

# distance matrix
Dist = dist(x)
Y = nonMDS(Dist)

plot(Y[[1]],type="n",ylab=expression(x[2]),xlab=expression(x[1]),ylim=c(min(Y[[1]][,2]),max(Y[[1]][,2])),xlim=c(min(Y[[1]][,1]),max(Y[[1]][,1])))
points(Y[[1]],pch=c(col),cex=1)
title("US crime")
text(Y[[1]],text1,pos=4,xpd=NA)
