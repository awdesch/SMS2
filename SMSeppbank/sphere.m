% sphere data transform
function [z] = sphere(x)
    x = x-repmat(mean(x),length(x),1);
    [u s v] = svd(cov(x));
    s = u./repmat(sqrt(diag(s))',size(u,1),1);
    z = x*s;
end