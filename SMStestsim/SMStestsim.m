% clear variables, close windows
clear all
close all
clc

 % set pseudo random numbers
RandStream.setDefaultStream(RandStream('mt19937ar','seed',98));

p   = 2;
n   = 100;    % number of observations
u   = [1;2]; % mean

covMatrix = [1  , 0.5 ; % covariance matrix
             0.5, 2  ];

standardNormal = normrnd(0,1,p,n);

 % eigenvectors and eigenvalues
[evec eval] = eigs(covMatrix);

covMatrix12 = evec*diag(sqrt(diag(eval)))*evec';

X = covMatrix12*standardNormal+repmat(u,1,n);

A = [2 -1];

a = 0.2;

xBar = mean(X')';

% test statistic
test1 = n*(A*xBar-a)*inv(A*covMatrix*A')*(A*xBar-a);
disp('test statistic if covariance known')
disp(test1)

% critical value
critval1 = chi2inv(0.95,1);
disp('critical value if covariance known')
disp(critval1)

S = cov(X');
% test statistic
test2 = (n-1)*(A*xBar-a)*inv(A*S*A')*(A*xBar-a);
disp('test statistic if covariance unknown')
disp(test2)


% critical value
critval2 = finv(0.95,1,n-1);
disp('critical value if covariance unknown')
disp(critval2)
