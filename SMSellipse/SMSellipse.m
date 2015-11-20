% ---------------------------------------------------------------------
% Book:         SMS
% ---------------------------------------------------------------------
% Quantlet:     SMSellipse
% ---------------------------------------------------------------------
%               SMSellipse computes ellipsoids for varying rho and d. rho
%               is the direction and correlation parameter lying between -1 and 1. d
%               is the radius of the ellipsoids. Given a covariance 
%               structure Sigma, depending on rho, the ellipse function
%               calculates the cholesky decomposition of Sigma = Q'*Q,
%               resulting in a upper triangular matrix Q, which in turn
%               is used for the transformation of the unit circle with
%               respect to the direction. The shape of the ellipsoids
%               is in accordance with the correlation parameter rho.
% ---------------------------------------------------------------------
% See also:     SMSellipse, SMSjordandec
% ---------------------------------------------------------------------
% Keywords:     ellipse, correlation, plot, covariance matrix,
%               Cholesky decomposition
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       Plots of four ellipsoids.
% ---------------------------------------------------------------------
% Example:      Ellipsoids for rho = [0.5, -0.75, 0, 0.25]' and 
%               radius = [4, 4, 4, 1]' are plotted.
% ---------------------------------------------------------------------
% Autor:        Awdesch Melzer, Dedy Dwi Prastyo 20121128
%----------------------------------------------------------------------

% clear variables and close windows
clear all
close all
clc


ucircle = [cos((0:360)/180*pi);sin((0:360)/180*pi)]'; % unit cirle


% rho and d
rhovec  = [0.5,-0.75,0,0.25]';          % directions
dvec    = [4,4,4,1]';                   % radius


for i = 1:4
    r       = rhovec(i);
    d       = dvec(i);
    c       = [0,0]';
    n       = 101;
    c1      = [1,r]';
    c2      = [r,1]';
    sha     = [c1,c2];
    Q       = chol(sha);                 % cholesky decomposition for reshape the unit circle
    radius  = d; 
    D       = radius .* (ucircle * Q)';  % change directions via cholesky decomposition
    Center  = repmat(c,1,size(D,2));     % center matrix
    ellipse = (Center + D)'; % reconstruct ellipse
    
    subplot(2,2,i)
    plot(ellipse(:,1),ellipse(:,2),'LineWidth',2)
    str = sprintf('radius, d = %3.2f , rho, r = %3.2f ', d , r);
    title(str,'FontSize',12,'FontWeight','Bold')
    box on
    set(gca,'LineWidth',1.6)
end

