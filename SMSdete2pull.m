% -------------------------------------------------------------------------
% Book:        SMS
% -------------------------------------------------------------------------
% Quantlet:    SMSdete2pull
% -------------------------------------------------------------------------
% Description: SMSdete2pull coefficients of determination for pullover sales.
% -------------------------------------------------------------------------
% Input:       None.
% -------------------------------------------------------------------------
% Output:      Tables of estimated coefficients, F-test and R-squared.
% -------------------------------------------------------------------------
% Results:     
% Model with constant and 1 regressor
% coefficients
%   210.7736
%    -0.3640
% 
%    F-test    p-value  error-variance
%    1.0e+03 *
% 
%     0.0002    0.0006    1.2601
% 
% R-squared: One explanatory variable:
%     0.0281
% 
% Model with constant and 2 regressors
% coefficients
%   176.6919
%    -0.6013
%     0.5663
% 
%    F-test    p-value  error-variance
%    16.7993    0.0021  255.4789
% 
% R-squared: Two explanatory variables:
%     0.8276
% 
% Model with constant and 3 regressors
% coefficients
%    65.6696
%    -0.2158
%     0.4852
%     0.8437
% 
%    F-test    p-value  error-variance
%    19.4386    0.0017  161.2685
% 
% R-squared: Three explanatory variables:
%     0.9067
%  
% -------------------------------------------------------------------------
% Keywords:    linear model, linear regression, least squares, R-squared
% -------------------------------------------------------------------------
% See also:    SMSanovapull, SMSdete2pull, SMSdeterpull, SMSlinregpull,
%              SMSscabank45, SMScovbank
% -------------------------------------------------------------------------
% Author:      Awdesch Melzer 20131023
% -------------------------------------------------------------------------

clear all
close all
clc


load pullover.dat

data = pullover;
y    = data(:,1);        % sales
x1   = ones(10,1);       % constant
x2   = [x1,data(:,2)];   % price
x23  = [x1,data(:,2:3)]; % price and advertisement
x234 = [x1,data(:,2:4)]; % price, advertisement, ass. hours

[b2,bint2,r2,rint2,stats2]           = regress(y,x2);

disp('Model with constant and 1 regressor')
disp('coefficients')
disp(b2)
disp('   F-test    p-value  error-variance')
disp(stats2(2:4))

disp('R-squared: One explanatory variable:')
disp(stats2(1))

[b23,bint23,r23,rint23,stats23]      = regress(y,x23);

disp('Model with constant and 2 regressors')
disp('coefficients')
disp(b23)

disp('   F-test    p-value  error-variance')
disp(stats23(2:4))

disp('R-squared: Two explanatory variables:')
disp(stats23(1))


[b234,bint234,r234,rint234,stats234] = regress(y,x234);
disp('Model with constant and 3 regressors')
disp('coefficients')
disp(b234)

disp('   F-test    p-value  error-variance')
disp(stats234(2:4))

disp('R-squared: Three explanatory variables:')
disp(stats234(1))


