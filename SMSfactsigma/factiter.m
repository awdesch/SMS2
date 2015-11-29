%% factor analysis using iterated principal factors method
%  returns the communalties after each iteration and 
%  the final un-rotated loadings.

function [comm, floadings] = factiter(r,niter,maxfactor)
  [m,n]          = size(r);
  temp           = zeros(m,n);
  comm           = zeros(niter+1,n);
  y              = factpf(r);
  m              = size(y,2);
  temp(1:n,1:m)  = y;
  comm(1,:)      = sum(temp.^2,2);                 
  for i = 2:(niter+1)
    redcormat    = r;
    [a,b]        = size(r);
    redcormat(1:(a+1):a*b) = comm(i-1,:);
    [xvec xval]  = eig(redcormat);
    xval         = diag(xval);
    [xval, ind]     = sort(xval,'descend');
    xvec         = xvec(:,ind);
    m            = min(maxfactor,length(xval(xval>0)));
    for j = 1:m
      xvec(:,j)  = xvec(:,j)*sqrt(xval(j));
    end
    temp(1:n,1:m)= xvec(1:n,1:m);
    comm(i,:)    = sum(temp(1:n,1:m).^2,2);
  end
  floadings      = temp(1:n,1:m);
end
  
  