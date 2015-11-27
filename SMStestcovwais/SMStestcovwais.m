% clear variables and close windows
clear all
close all
clc

% load data
load('wais.dat');

x1   = wais(1:12,3:6);
x2   = wais(13:49,3:6);

% compute covariance
a    = cov(x1)*11/12;
b    = cov(x2)*36/37;

c    = (12*a+37*b)/49;

% test statistic
test = 49*log(det(c)) - 12*log(det(a)) - 37*log(det(b));
disp('test statistic')
disp(test) 

% critical value
crit = chi2inv(0.95,10);
disp('critical value')
disp(crit)
