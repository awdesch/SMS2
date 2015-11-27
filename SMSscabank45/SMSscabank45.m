% ---------------------------------------------------------------------
% Book:         SMS
% ---------------------------------------------------------------------
% Quantlet:     SMSscabank45
% ---------------------------------------------------------------------
% Description:  SMSscabank45 computes a two dimensional scatterplot of
%               X4 vs. X5 (upper inner frame vs. lower) of the Swiss
%               bank notes data (bank2.dat).
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       Two dimensional scatterplot of X4 vs. X5 (upper inner
%               frame vs. lower) of the Swiss bank notes data
%               (bank2.dat).
% ---------------------------------------------------------------------
% Example:      -
% ---------------------------------------------------------------------
% Author:       Awdesch Melzer 20121128
% ---------------------------------------------------------------------

% clear variables and close windows
clear all
close all
clc

% load data
bank2 = load('bank2.dat');

% scatterplot
plot(bank2(:,4),bank2(:,5),'ob','LineWidth',2)
title('Swiss bank notes','FontSize',16,'FontWeight','Bold')
xlabel('X[4]','FontSize',16,'FontWeight','Bold')
ylabel('X[5]','FontSize',16,'FontWeight','Bold')
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold') 
