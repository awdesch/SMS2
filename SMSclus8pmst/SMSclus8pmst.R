# clear cache and close windows
graphics.off()
rm(list=ls(all=TRUE))

# define eight points, compute distance matrix
eight        = cbind(c(-3,-2,-2,-2,1,1,2,4),c(0,4,-1,-2,4,2,-4,-3))
eight        = eight[c(8,7,3,1,4,2,6,5),]
dist_eight   = (as.matrix(dist(eight, method = "euclidian")))^2

dev.new()
# plot eight points using average linkage
par(mfrow = c(1, 1),cex=1)

plot(eight, pch=16, xlab="price conciousness",ylab="brand loyalty",main="8 points",
     xlim=c(-4.1,4.1),ylim=c(-4.1,4.1))

# Plot Lines
for (i in 1:8){
  for (j in 1:8){
    segments(eight[i,1],eight[i,2 ],eight[j,1 ],eight[j,2],lwd=2,"black")
  }
}

# Plot Distances
for (i in 1:8){
  for (j in 1:8){
    if (i!=j){
      points((eight[i,1]+eight[j,1])/2, (eight[i,2]+eight[j,2])/2, pch=22, cex=3, bg="white")
      text((eight[i,1]+eight[j,1])/2, (eight[i,2]+eight[j,2])/2 ,
           dist_eight[i,j],col="red3", cex = 0.8)     
    }
  }
}

# Plot Nodes
points(eight, pch=21, cex=3, bg="white")
text(eight[,1],eight[,2],as.character(1:8),col="blue3",cex=1)