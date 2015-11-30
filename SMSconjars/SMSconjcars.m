% clear variables and close windows
clear all
close all
clc

% main calculation
y1  = [1,3,2,5,4,6];
y2  = [7,8,9,10,12,11];
y3  = [13,15,14,16,17,18];
Y1  = [y1;y2;y3];          %loading preferences - 3 levels of motors

y1  = [1,3,2,7,8,9,13,15,14];
y2  = [5,4,6,10,12,11,16,17,18];
Y2  = [y1;y2];             %loading preferences - 2 levels of safety

y1  = [1,7,13,5,10,16];
y2  = [3,8,15,4,12,17];
y3  = [2,9,14,6,11,18];
Y3  = [y1;y2;y3];          %loading preferences - 3 levels of doors

alpha = 0.975;             % 95% confidence interval level

Y1
DoIt(Y1,alpha)

Y2
DoIt(Y2,alpha)

Y3
DoIt(Y3,alpha)