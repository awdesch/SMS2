% ---------------------------------------------------------------------
% Book:         SMS
% ---------------------------------------------------------------------
% Quantlet:     SMSlinregpull
% ---------------------------------------------------------------------
% Description:  It computes a linear regression of sales (X1) 
%               on price (X2) from the pullovers data set 
%               (pullover.rda). It checks for outliers using a rule on
%               standardized residuals and computes the same model for
%               the subset of the pullover data without outliers. Both
%               regression lines are plotted in the same scatterplot,
%               the outliers are marked as red triangles.
% ---------------------------------------------------------------------
% See also:     SMSanovapull, SMSdete2pull, SMSdeterpull, SMSlinregpull,
%               SMSscabank45, SMScovbank
% ---------------------------------------------------------------------
% Keywords:     linear, linear model, linear regression, least-squares, R-squared
%               regression, F test, F-statistic, F-test, test, summary,
%               statistics, boxplot, five number summary, plot,
%               data visualization, graphical representation,
%               visualization, scatterplot, 
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       Linear regression of sales (X1) on price (X2) from the
%               pullovers data set (pullover.dat).
% ---------------------------------------------------------------------
% Example:      Scatterplot of pullover data with a regression line with
%               and without outliers, and a boxplot
% ---------------------------------------------------------------------
% Author:       Norman Duckwitz 20140220
% ---------------------------------------------------------------------

% clear variables and close windows
clear all
close all
clc

load('pullover.dat');           % load data
x     = pullover;               
[m,n] = size(x);                % retrieve dimensions
sales = x(:,1);                 % specify sales variable
price = x(:,2);                 % specify price variable

 % Construct X matrix
ones  = ones(m,1);             % create variable for calculation of the intercept
X     = [ones x(:,2)];         % specify regressor matrix with variable for intercept and price


 % Regresssion Sales ~ Price whole set
whichstats = {'standres','r','beta'};                   % specify options on regression output
stats      = regstats(sales,price,'linear',whichstats); % summary statistics of regression
stdres     = stats.standres;                            % standardized residuals
beta       = stats.beta;                                % coefficients
r          = stats.r;                                   % residuals

outlier    = (abs(stdres)>2)                            % dummy variable if outlier {1}, else {0} 

 % Regresssion Sales ~ Price without outliers
whichstats = {'standres','r','beta'};
stats      = regstats(sales(outlier~= 1),price(outlier~= 1),'linear',whichstats); % regression using sample without outliers
stdreso    = stats.standres;                           % standardized residuals
betao      = stats.beta;                               % coefficients
ro         = stats.r;                                  % residuals

xmin       = min(price);                               % specify lower border of x-axis for plot
xmax       = max(price)+2;                             % specify upper border of x-axis for plot
ymin       = min(sales)-2;                             % specify lower border of y-axis for plot
ymax       = max(sales)+2;                             % specify upper border of y-axis for plot

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

% print -painters -dpdf -r600 SMSlinregpull.pdf
% print -painters -dpng -r600 SMSlinregpull.png
