% clear variables and close windows
clear all
close all
clc

% load data
load('athletic.mat')

x = athletic.data; % subsample
x = zscore(x);     % standardized
d = dist(x');      % distance matrix

% nonmetric MDS
[Y,stress,disparities] = mdscale(d,2,'criterion','stress');

% plot
rows = athletic.textdata(2:end,1);
plot(Y(:,1),-Y(:,2),'wo')
title('athletic records','FontSize',16,'FontWeight','Bold')
ylabel('x_2','FontSize',16,'FontWeight','Bold')
xlabel('x_1','FontSize',16,'FontWeight','Bold')
text(Y(:,1),-Y(:,2),rows,'FontSize',14)
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')
