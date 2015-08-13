% -------------------------------------------------------------------------
% Book:        SMS
% -------------------------------------------------------------------------
% Quantlet:    SMSdeterpull
% -------------------------------------------------------------------------
% Description: SMSdeterpull compares linear regression of  sales (X1) on 
%              price and advert (X2, X3) and price and ass. hours (x2,x4)
%              from the pullovers data set ("pullover.dat")
% -------------------------------------------------------------------------
% Input:       None.
% -------------------------------------------------------------------------
% Output:      Tables of estimated coefficients, F-test and R-squared.
% -------------------------------------------------------------------------
% Results:     
% Model with constant and price and advert. as regressor
% coefficients
%   176.6919
%    -0.6013
%     0.5663
% 
%    F-test    p-value  error-variance
%    16.7993    0.0021  255.4789
% 
% R-squared: One explanatory variable:
%     0.8276
% 
% Model with constant and price and ass. hours as regressor
% coefficients
%   -24.1914
%     0.3485
%     1.7104
% 
%    F-test    p-value  error-variance
%     2.5421    0.1479  858.3230
% 
% R-squared: One explanatory variable:
%     0.4207
% -------------------------------------------------------------------------
% Keywords:    linear, linear model, linear regression, least-squares, R-squared
%              regression, F test, F-statistic, F-test, test, summary,
%              statistics
% -------------------------------------------------------------------------
% See also:    SMSanovapull, SMSdete2pull, SMSdeterpull, SMSlinregpull,
%              SMSscabank45, SMScovbank
% -------------------------------------------------------------------------
% Author:      Awdesch Melzer 20131105
% -------------------------------------------------------------------------

clear all
close all
clc


load pullover.dat

data   = pullover;
 y     = data(:,1);                 % sales (X1)
 x23   = data(:,[2,3]);             % price and advert. (X2 and X3)
 x24   = data(:,[2,4]);             % price and ass. hours. (X2 and X4)
 x1    = ones(10,1);                % constant

 [b23,bint23,r23,rint23,stats23] = regress(y,[x1,x23]);
 [b24,bint24,r24,rint24,stats24] = regress(y,[x1,x24]);
 
disp('Model with constant and price and advert. as regressor')
disp('coefficients')
disp(b23)
disp('   F-test    p-value  error-variance')
disp(stats23(2:4))

disp('R-squared: One explanatory variable:')
disp(stats23(1))

disp('Model with constant and price and ass. hours as regressor')
disp('coefficients')
disp(b24)
disp('   F-test    p-value  error-variance')
disp(stats24(2:4))

disp('R-squared: One explanatory variable:')
disp(stats24(1))
