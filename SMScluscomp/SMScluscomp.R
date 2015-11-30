# clear cache and close windows
graphics.off()
rm(list=ls(all=TRUE))

# setwd("C:/...")         # please set your working directory to load company data

  opar = par(c(1,1),cex=1)

 load('uscomp.rda')       # load data
 uscomp$Sales    = as.numeric(as.character(uscomp$Sales)) # eliminate data error
 uscomp$Sales[65]= 1601

 xx    = as.matrix(uscomp[,c(-7)]) # data without sectors
 xxi   = substr(as.character(uscomp$Sector),1,3) # take first 2 letters of sector names
 xxxi  = row.names(uscomp)         # set company names
 n     = nrow(xx)                            # sample size
 # scaling (arbitrary)
 meanxx=apply(xx,2,mean)
 x     = t(t(xx)-meanxx)
 minxx = apply(xx,2,min)
 maxxx = apply(xx,2,max)
 varxx = apply(xx,2,var)
 xxp   = log(t(t(xx)-minxx+(maxxx-minxx)/200))
 xxp   = round(xxp,4)
 sxx   = matrix(sqrt(varxx),nrow=78,ncol=6,byrow=TRUE)
 # eigenvalue decomposition
 e=eigen(cov(xxp),sym=TRUE)               # eigensystem analysis
 tmp=cbind(e$va,t(e$ve))               # sort by eigenvalues
 
 jsort = function(mat){  # sorting function
    s  = sort(mat[,1],decr=TRUE,ind=TRUE)
    return(mat[s$ix,])
 }

 tmp   = jsort(tmp)
 e     = tmp[,1]
 v     = -tmp[,2:7]     # set eigenvector signs according to book
 v[c(4,6),]= -v[c(4,6),]
 y     = xxp%*%t(v)                          # PCA transformation
 y     = y[,1:2]
 y2    = y
 tc    = matrix(1,nrow=n)
 plabels= xxxi                               # set labels for each company
 plot(y,type="n",xlab="PC1",ylab="PC2",main="US companies") # principal component plot
 text(y,label=plabels,xpd=NA)

 label = uscomp$Sector
 label1= sapply(label,substr,1,2)
 rownames(xx)=label1
# second part
 d     = dist(xx,method="manhattan")
 tree  = hclust(d,method="ward.D")
 # show the dendrogram 
 dev.new()
 opar  = par(c(1,1),cex.axis=1.2,cex.lab=1.4,cex.main=1.4,cex=0.5)
 plot(as.dendrogram(tree),horiz=T,main="Ward dendrogram for US companies")
 par(opar)
 g.points = cutree(tree,5)

# show the clusters 
 dev.new()
 opar = par(c(1,1),cex=1.0)
 plot(y2, main="US companies: five clusters",xlab="PC1",ylab="PC2",type="n")
 points(y2,pch=g.points)
 text(matrix(y2[label1=="Co"],ncol=2),labels="Co",xpd=NA,col="navy",pos=4)
 text(matrix(y2[label1=="En"],ncol=2),labels="En",xpd=NA,col="blue",pos=4)
 text(matrix(y2[label1=="Fi"],ncol=2),labels="Fi",xpd=NA,col="darkgreen",pos=4)
 text(matrix(y2[label1=="Hi"],ncol=2),labels="Hi",xpd=NA,col="red",pos=4)
 text(matrix(y2[label1=="Ma"],ncol=2),labels="Ma",xpd=NA,col="black",pos=4)
 text(matrix(y2[label1=="Me"],ncol=2),labels="Me",xpd=NA,col="darkgrey",pos=4)
 text(matrix(y2[label1=="Ot"],ncol=2),labels="Ot",xpd=NA,col="brown",pos=4)
 text(matrix(y2[label1=="Re"],ncol=2),labels="Re",xpd=NA,col="orange",pos=4)
 text(matrix(y2[label1=="Tr"],ncol=2),labels="Tr",xpd=NA,col="purple",pos=4)
 par(opar)
