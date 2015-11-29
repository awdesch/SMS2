%% factor analysis using principal factors method with unrotated loadings

function xvec = factpf(r)
  [m, n]                 = size(r);
  redcormat              = r;
  redcormat(1:(m+1):m*n) = max(abs(r-diag(diag(ones(size(redcormat,1))))));
  [xvec, xval]           = eig(redcormat);
  xval                   = diag(xval);
  [xval, ind]            = sort(xval,'descend');
  xvec                   = xvec(:,ind);
  for i = 1:length(xval(xval>0))
    xvec(:,i)            = xvec(:,i)*sqrt(xval(i));
  end
  xvec                   = xvec(:,xval>0);
end