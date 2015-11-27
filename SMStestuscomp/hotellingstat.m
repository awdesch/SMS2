%---------------------------------------------------------------------
% Book:         SMS
% ---------------------------------------------------------------------
% Quantlet:     hotellingstat
% ---------------------------------------------------------------------
% Description:  hotellingstat gives for input matrices x1 and x2 the
%               hotelling test statistic on equality of mulitvariate 
%               mean (t2.t2), the degrees of freedom
%               (t2.df) and the p-value (t2.pval)
% ---------------------------------------------------------------------
% Usage:        [t2] = hotellingstat(x1, x2)
% ---------------------------------------------------------------------
% Inputs:       x1, x2 - multivariate data matrices
% ---------------------------------------------------------------------
% Output:       test of the equality of multivariate means
% ---------------------------------------------------------------------
% Keywords:     Hotelling test, multivariate mean test
% ---------------------------------------------------------------------
% See also:     SMSlinregbank2, SMSlinregvocab, SMSprofil, SMSprofplasma,
%               SMStestcov4i, SMStestcov, SMStestsim, SMStestcovwais
% ---------------------------------------------------------------------
% Author:       Awdesch Melzer 20140318
% ---------------------------------------------------------------------


function [t2] = hotellingstat(x1, x2)

    % get the sample sizes for each sample
    nx = size(x1,1);
    ny = size(x2,1);

    px = size(x1,2);
    py = size(x2,2);

    p  = px;

    mx = mean(x1);
    my = mean(x2);

 
    sx = cov(x1);
    sy = cov(x2);
 
    sPooled    = ((nx - 1)*sx + (ny - 1)*sy)/(nx + ny - 2);
    sPooledInv = inv(sPooled);

    T2      = (mx - my) * sPooledInv * (mx - my)'*nx*ny/(nx + ny);
    m       = (nx + ny - p - 1)/(p*(nx + ny - 2));
    t2.T2   = T2;
    t2.m    = m;
    t2.df   = [p, nx+ny-p-1];
    t2.nx   = nx;
    t2.ny   = ny;
    t2.p    = p;
    
    t2.t2   = m*T2;
    t2.pval = 1 - fcdf(m*T2, p,nx+ny-p-1);

