clear all
close all
clc

% unique solution of the factor model

sigma  = [1,0.9,0.7;
          0.9,1,0.4;
          0.7,0.4,1];

m      = 100;

[PFA.comm, PFA.floadings] = factiter(sigma,m,1);

% factor loadings
disp('factor loadings:')
disp(PFA.floadings)

% specific variances
disp('specific variances:')
disp(1-PFA.comm((m+1),:))
