% -------------------------------------------------------------------------
% Book:         SMS
% -------------------------------------------------------------------------
% Quantlet:     SMSlinregvocab
% -------------------------------------------------------------------------
% Description:  computes a linear regression of vocab. score in
%               grade 11 on vocabulary grades in previous years for the
%               vocabulary data ('vocabulary.dat')
%               Linear Regressions:
%               grade11 = cons + grade8 + grade9 + grade10 + epsilon
%               grade11 = cons + grade9 + grade10 + epsilon
% -------------------------------------------------------------------------
% Usage:		-
% -------------------------------------------------------------------------
% See also:     -
% -------------------------------------------------------------------------
% Inputs:       none
% -------------------------------------------------------------------------
% Output:       Coefficients, Standard Errors, p-values, t-stats and other 
%               statistics of the two linear regressions
% -------------------------------------------------------------------------
% Example:      -
% -------------------------------------------------------------------------
% Results:
% Regression results: regress "grade11" on "grade8", "grade9" and "grade10"
%
% Linear regression model:
%     y ~ 1 + x1 + x2 + x3
%
% Estimated Coefficients:
%                    Estimate    SE         tStat     pValue
%     (Intercept)     1.4782     0.29993    4.9286    6.8605e-06
%     x1             0.20149     0.15824    1.2733       0.20781
%     x2             0.22782     0.11521    1.9775      0.052587
%     x3             0.39651      0.1304    3.0408     0.0034955
%
%
% Number of observations: 64, Error degrees of freedom: 60
% Root Mean Squared Error: 1.07
% R-squared: 0.704,  Adjusted R-Squared 0.689
% F-statistic vs. constant model: 47.6, p-value = 7.14e-16
% Regression results: regress "grade11" on "grade9" and "grade10"
%
% Linear regression model:
%     y ~ 1 + x1 + x2
%
% Estimated Coefficients:
%                    Estimate    SE         tStat     pValue
%     (Intercept)     1.2355      0.2327    5.3092    1.6292e-06
%     x1             0.28931     0.10513    2.7518     0.0077927
%     x2             0.50222     0.10107    4.9692    5.7517e-06
%
%
% Number of observations: 64, Error degrees of freedom: 61
% Root Mean Squared Error: 1.08
% R-squared: 0.696,  Adjusted R-Squared 0.686
% F-statistic vs. constant model: 69.9, p-value = 1.66e-16
% -------------------------------------------------------------------------
% Keywords:    linear model, linear regression, least squares, R-squared,
%              gls
% -------------------------------------------------------------------------
% See also:    SMSlinregbank2, SMSlinregvocab, SMSprofil, SMSprofplasma,
%              SMStestcov, SMStestcov4i, SMStestcovwais, SMStestsim,
%              SMStestuscomp
% -------------------------------------------------------------------------
% Author:       Denise Sengül
% -------------------------------------------------------------------------

clear all
close all
clc

% import data
    load('vocabulary.dat');

% run linear regressions
    X1 = vocabulary(:,2:4);
    X2 = vocabulary(:,3:4);
    y = vocabulary(:,5);
    reg1 = LinearModel.fit(X1,y);
    reg2 = LinearModel.fit(X2,y);

% display results
    disp('Regression results: regress "grade11" on "grade8", "grade9" and "grade10"')
    disp(reg1)
    disp('Regression results: regress "grade11" on "grade9" and "grade10"')
    disp(reg2)
