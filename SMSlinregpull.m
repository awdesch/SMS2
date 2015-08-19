% ---------------------------------------------------------------------
% Book:         SMS
% ---------------------------------------------------------------------
% Quantlet:     SMSlinregpull
% ---------------------------------------------------------------------
% Description:  SMSlinregpull computes a linear regression of sales (X1) 
%               on price (X2) from the pullovers data set 
%               (pullover.dat).
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       Linear regression of sales (X1) on price (X2) from the
%               pullovers data set (pullover.dat).
% ---------------------------------------------------------------------
% Example:      
% ---------------------------------------------------------------------
% Author:       Norman Duckwitz 20140220
% ---------------------------------------------------------------------

clear all
close all
clc

load('pullover.dat');           % load data
x     = pullover;
[m,n] = size(x);
sales = x(:,1);
price = x(:,2);

 % Construct X matrix
ones  = ones(m,1);
X     = [ones x(:,2)];


 % Regresssion Sales ~ Price whole set
whichstats = {'standres','r','beta'};
stats      = regstats(sales,price,'linear',whichstats);
stdres     = stats.standres;
beta       = stats.beta;
r          = stats.r;

outlier    = (abs(stdres)>2)

 % Regresssion Sales ~ Price without outliers
whichstats = {'standres','r','beta'};
stats      = regstats(sales(outlier~= 1),price(outlier~= 1),'linear',whichstats);
stdreso    = stats.standres;
betao      = stats.beta;
ro         = stats.r;

xmin       = min(price);
xmax       = max(price)+2;
ymin       = min(sales)-2;
ymax       = max(sales)+2;

 % Plot

subplot(1,2,1)
scatter(price(outlier~= 1),sales(outlier~= 1),'k');
hold on
scatter(price(outlier== 1),sales(outlier== 1),'^','filled','red');
line(price,X*beta,'Color','b','LineStyle','-','LineWidth',0.5);
line(price(outlier~= 1),X(outlier~= 1,:)*betao,'Color','black','LineStyle','--','LineWidth',0.5);
axis([xmin xmax ymin ymax]);
xlabel('Price');
ylabel('Sales');
title('Regression with Outliers');
box on
hold off

subplot(1,2,2);
boxplot(r,'Symbol','o','labels',{''});
title('Boxplot of Residuals');

 print -painters -dpdf -r600 SMSlinregpull.pdf
 print -painters -dpng -r600 SMSlinregpull.png
