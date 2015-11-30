
%ppf computes the Friedman Tukey index (integral about the squared density of the projected data) via kernel density estimation
function ind = ppf(px,h)
    [dens,xh] = ksdensity(sort(px),'width',h,'kernel','epanechnikov');
    ind  = mean(dens);
end