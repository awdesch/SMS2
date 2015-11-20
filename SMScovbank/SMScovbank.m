% -------------------------------------------------------------------------
% Book:        SMS
% -------------------------------------------------------------------------
% Quantlet:    SMScovbank
% -------------------------------------------------------------------------
% Description: It calculates the covariance matrix (and eigevalues)
%              of the Swiss Bank (bank2.dat) dataset and the variance of
%              the counterfeit bank notes (observations 101-200) after they 
%              were lineary transformed by a vector a = (1, 1, 1, 1, 1, 1)'.
% -------------------------------------------------------------------------
% Input:       None.
% -------------------------------------------------------------------------
% Output:      Eigenvalues and covariance matrix for the bank2 dataset.
% -------------------------------------------------------------------------
% Results:    
%
%   Covariance matrix:
%   V =
%
%    0.1418    0.0314    0.0231   -0.1032   -0.0185    0.0843
%    0.0314    0.1303    0.1084    0.2158    0.1050   -0.2093
%    0.0231    0.1084    0.1633    0.2841    0.1300   -0.2405
%   -0.1032    0.2158    0.2841    2.0869    0.1645   -1.0370
%   -0.0185    0.1050    0.1300    0.1645    0.6447   -0.5496
%    0.0843   -0.2093   -0.2405   -1.0370   -0.5496    1.3277
%
%   Eigenvalues:
%   e =
%
%    3.0003         0         0         0         0         0
%         0    0.9356         0         0         0         0
%         0         0    0.2434         0         0         0
%         0         0         0    0.1947         0         0
%         0         0         0         0    0.0852         0
%         0         0         0         0         0    0.0355%
%
%   Variance of the transformed counterfeit bank notes:
%   v =
%
%    1.7423
% -------------------------------------------------------------------------
% Keywords:    covariance, eigenvalues, spectral decomposition,
%              decomposition, eigenvalue decomposition, multivariate,
%              multi dimensional, variance, transformation, Covariance
% -------------------------------------------------------------------------
% See also:    SMSanovapull, SMSdete2pull, SMSdeterpull, SMSlinregpull,
%              SMSscabank45
% -------------------------------------------------------------------------
% Author:      Awdesch Melzer 20131023
% -------------------------------------------------------------------------

clear all
close all
clc

load bank2.dat;

V      = cov(bank2);                  % variance matrix
V
[v, e] = eigs(V);                     % eigenvalues of V
e
a      = ones(6,1);
v      = var((bank2(101:200,:))*a);   % the variance of the row sum
v
