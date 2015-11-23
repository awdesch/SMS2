# clear variables and close windows
rm(list=ls(all=TRUE))
graphics.off()

# install and load packages
libraries = c("aplpack")
lapply(libraries, function(x) if (!(x %in% installed.packages())) {
  install.packages(x)
})
lapply(libraries, library, quietly = TRUE, character.only = TRUE)

set.seed(1)                      # set pseudo random numbers
q      = matrix(0, ncol = 36);   # define new variable
q[,13] = 1;                      # right face line
q[,14] = 1;                      # right darkness of hair
q[,31] = 1;                      # left face line
q[,32] = 1;                      # left darkness of hair
x      = rnorm(50);              # generates 50 standard normal distributed data
y      = rnorm(50) + 2;          # generates 50 normal distributed data with mean 2
z      = t(cbind(t(x),t(y)));    # puts the data together in matrix
z      = (z-1)/sqrt(2)           # rescale z
faces(as.matrix(z[1:50]),   q, main="Observations 1 to 50",   scale=FALSE, ncol.plot=5, nrow.plot=10);   # plots the Flury faces
dev.new()
faces(as.matrix(z[51:100]), q, main="Observations 51 to 100", scale=FALSE, ncol.plot=5, nrow.plot=10);   # plots the Flury faces