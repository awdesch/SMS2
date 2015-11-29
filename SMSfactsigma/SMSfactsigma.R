# clear workspace
 rm(list=ls(all=TRUE))
 graphics.off()

sigma = matrix(c(1,0.9,0.7,0.9,1,0.4,0.7,0.4,1),nrow=3)

###########################
#performs factor analysis using principal factors method
#returns the un-rotated loadings

factpf = function(r){
  n         = ncol(r)
  redcormat = r
  diag(redcormat) = apply(abs(r-diag(1,nrow=n,ncol=n)),2,max)
  xeig      = eigen(redcormat)
  xval      = xeig$values
  xvec      = xeig$vectors
  for (i in 1:length(xval[xval>0])){
    xvec[,i] = xvec[,i]*sqrt(xval[i])}
  rownames(xvec) = colnames(r)
  return(xvec[,xval>0])
}

########################################
#performs factor analysis using iterated principal factors method
#returns the communalties after each iteration and the final un-rotated loadings.

factiter = function(r,niter=10,maxfactors=ncol(r)){
  n        = ncol(r)
  temp     = matrix(0,nrow=n,ncol=n)
  comm     = matrix(0,nrow=niter+1,ncol=n)
  y        = factpf(r)
  m        = ncol(y)
  temp[1:n,1:m] = y
  comm[1,] = apply(as.matrix(temp)^2,1,sum)                 
  for (i in 2:(niter+1)){
    redcormat  = r
    diag(redcormat) = comm[i-1,]
    xeig       = eigen(redcormat)
    m          = min(maxfactors,length(xeig$values[xeig$values>0]))
    for (j in 1:m){
    xeig$vectors[,j] = xeig$vectors[,j]*sqrt(xeig$values[j])} 
    temp[1:n,1:m]    = xeig$vectors[1:n,1:m]
    comm[i,]         = apply(as.matrix(temp[1:n,1:m]^2),1,sum)
  }
  f.loadings           = temp[1:n,1:m]
  rownames(f.loadings) = colnames(r)
  return(list(comm=comm,f.loadings=f.loadings))
}

 
##############################################
m   = 100 # maximal number of iterations

PFA = factiter(sigma,niter=m,maxfactor=1)

## factor loadings
print("factor loadings:")
print(PFA$f.loadings)

## specific variances
print("specific 'variances':")
print(1-PFA$comm[(m+1),])
