# clear variables and close windows
rm(list = ls(all=TRUE))
graphics.off()

# wak == 1

# load data

load("ushealth.rda")
x     = ushealth
for (i in 1:ncol(x)){
     x[,i] = as.numeric(x[,i]) 
}
  col   = x[,ncol(x)-1]        # region numbers (Northeast, Midwest, South, West)
  col   = as.numeric(col)+c(rep(-1,37),rep(0,13))
  x     = x[,3:9]
# labels for regions
  xrows = row.names(x)
  #c("ME","NH","VT","MA","RI","CT","NY","NJ","PA","OH","IN","IL","MI","WI","MN","IA","MO","ND","SD","NE","KS","DE","MD","VA","WV","NC","SC","GA","FL","KY","TN","AL","MS","AR","LA","OK","TX","MT","ID","WY","CO","NM","AZ","UT","NV","WA","OR","CA","AK","HI")
# labels for crimes
  xcols = c("accident","cardiovascular","cancer","pulmonary","pneumonia flu","diabetes","liver")
  
  colnames(x) = xcols
  rownames(x) = xrows
  wak   = 1                      # set to 0/1 to ex/include Alaska!!
  wak   = c(rep(1,nrow(x)-2),wak,1)
  x     = subset(x,wak==1)  
  xrows = subset(xrows,wak==1)
  col   = subset(col,wak==1)   
  a     = rowSums(x)
  b     = colSums(x)

  e     = as.matrix(a)%*%b/sum(a)

#chi-matrix
  cc    = (x-e)/sqrt(e)

#singular value decomposition
  sv    = svd(cc)
  g     = sv$u
  l     = sv$d
  d     = sv$v

#eigenvalues
  ll    = l*l
#cumulated percentage of the variance
  aux   = cumsum(ll)/sum(ll)
  perc  = cbind(ll,aux)

  r1    = matrix(as.matrix(l),nrow=nrow(g),ncol=ncol(g),byrow=T)*g #multiplies each column of g with each corresponding element of l
  r     = (r1/matrix(sqrt(as.matrix(a)),nrow=nrow(g),ncol=ncol(g),byrow=F))*(-1) #divides each row of r1 with each corresponding element of sqrt(a)

  s1    = matrix(l,nrow=nrow(d),ncol=ncol(d),byrow=T)*d #multiplies each column of d with each corresponding element of l
  s     = (s1/matrix(sqrt(b),nrow=nrow(d),ncol=ncol(d),byrow=F))*(-1) #divides each row of s1 with each corresponding element of sqrt(b)

  car   = matrix(matrix(a),nrow=nrow(r),ncol=ncol(r),byrow=F)*r^2/matrix(l^2,nrow=nrow(r),ncol=ncol(r),byrow=T) #contribution in r

  cas   = matrix(matrix(b),nrow=nrow(s),ncol=ncol(s),byrow=F)*s^2/matrix(l^2,nrow=nrow(s),ncol=ncol(s),byrow=T) #contribution in s

  rr    = t(t(r[,1:2])*sign(r[50,1:2]))
  ss    = t(t(s[,1:2])*sign(s[7,1:2]))
  
plot(rr[,1],rr[,2],xlab=expression(list(r[1],s[1])),ylab=expression(list(r[2],s[2])),main="US health",pch=c(col),ylim=c(min(rr[,2],ss[,2]),max(rr[,2],ss[,2])),xlim=c(min(rr[,1],ss[,1]),max(rr[,1],ss[,1])))
text(ss[,1],ss[,2],xcols,cex=1.8,col="red",xpd=NA)
points(ss[,1],ss[,2],type="n")
text(rr[,1],rr[,2],xrows,col="blue",pos=4,xpd=NA)
abline(h=0,v=0,lwd=2)

# the same analysis without Alaska:
# wak == 0

  x     = ushealth
  for (i in 1:ncol(x)){
        x[,i] = as.numeric(x[,i]) 
  }
  col   = x[,ncol(x)-1]       # region numbers (Northeast, Midwest, South, West)
  col   = as.numeric(col)+c(rep(-1,37),rep(0,13))
  x     = x[,3:9]
# labels for regions
  xrows = row.names(x)
  #c("ME","NH","VT","MA","RI","CT","NY","NJ","PA","OH","IN","IL","MI","WI","MN","IA","MO","ND","SD","NE","KS","DE","MD","VA","WV","NC","SC","GA","FL","KY","TN","AL","MS","AR","LA","OK","TX","MT","ID","WY","CO","NM","AZ","UT","NV","WA","OR","CA","AK","HI")
# labels for crimes
  xcols = c("accident","cardiovascular","cancer","pulmonary","pneumonia flu","diabetes","liver")
  
  colnames(x) = xcols
  rownames(x) = xrows
  wak   = 0                      # set to 0/1 to ex/include Alaska!!
  wak   = c(rep(1,nrow(x)-2),wak,1)
  x     = subset(x,wak==1)  
  xrows = subset(xrows,wak==1)
  col   = subset(as.numeric(col),wak==1)   
  a     = rowSums(x)
  b     = colSums(x)

  e     = matrix(a)%*%b/sum(a) 
  
  #chi-matrix
  cc    = (x-e)/sqrt(e)
  #singular value decomposition
  sv    = svd(cc)
  g     = sv$u
  l     = sv$d
  d     = sv$v

#eigenvalues
  ll    = l*l
#cumulated percentage of the variance
  aux   = cumsum(ll)/sum(ll)
  perc  = cbind(ll,aux)
  r1    = matrix(l,nrow=nrow(g),ncol=ncol(g),byrow=T)*g # multiplies each column of g with each corresponding element of l
  r     = (r1/matrix(sqrt(a),nrow=nrow(g),ncol=ncol(g),byrow=F))*(-1) # divides each row of r1 with each corresponding element of sqrt(a)
  s1    = matrix(l,nrow=nrow(d),ncol=ncol(d),byrow=T)*d # multiplies each column of d with each corresponding element of l
  s     = (s1/matrix(sqrt(b),nrow=nrow(d),ncol=ncol(d),byrow=F))*(-1) # divides each row of s1 with each corresponding element of sqrt(b)
  car   = matrix(matrix(a),nrow=nrow(r),ncol=ncol(r),byrow=F)*r^2/matrix(l^2,nrow=nrow(r),ncol=ncol(r),byrow=T) # contribution in r
  cas   = matrix(matrix(b),nrow=nrow(s),ncol=ncol(s),byrow=F)*s^2/matrix(l^2,nrow=nrow(s),ncol=ncol(s),byrow=T) # contribution in s
  rr    = t(t(r[,1:2])*sign(r[49,1:2]))
  ss    = t(t(s[,1:2])*sign(s[7,1:2]))
dev.new()
plot(rr[,1],rr[,2],xlab=expression(list(r[1],s[1])),ylab=expression(list(r[2],s[2])),main="US health without AK",pch=col,ylim=c(min(rr[,2],ss[,2]),max(rr[,2],ss[,2])),xlim=c(min(rr[,1],ss[,1]),max(rr[,1],ss[,1])))
text(cbind(ss[,1],ss[,2]),xcols,cex=1.8,col="red",xpd=NA)
points(ss[,1],ss[,2],type="n")
text(cbind(rr[,1],rr[,2]),xrows,col="blue",pos=4,xpd=NA)
abline(h=0,v=0,lwd=2)