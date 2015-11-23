rm(list=ls(all=TRUE))
graphics.off()

# install and load packages
libraries = c("MASS", "scatterplot3d")
lapply(libraries, function(x) if (!(x %in% installed.packages())) {
  install.packages(x)
})
lapply(libraries, library, quietly = TRUE, character.only = TRUE)

set.seed(100);                             # pseudorandom numbers

n     = 300;                               # number of observations
mu    = c(0,0,0);                          # mean
sigma = diag(x = 1, nrow = 3, ncol = 3);   # covariance matrix

x     = mvrnorm(n, mu, sigma);             # multivariate normal random numbers

scatterplot3d(x, color = "red", main = "Standard Normal point cloud", grid = FALSE,xlab="",ylab="",zlab="");
