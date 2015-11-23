clear all
close all
clc

% set pseudo random numbers
RandStream.setGlobalStream(RandStream('mt19937ar','seed',98));

% main calculation
n = 300;            % number of observations
mu = [0,0,0];      % mean
sigma = diag([1,1,1]); % standard deviation

x = mvnrnd(mu, sigma,n); % generation of multivariate normal random numbers

% scatterplot

scatter3(x(:,1),x(:,2),x(:,3),'r','LineWidth',2);
xlim([-3,3]);
ylim([-3,3]);
zlim([-3,3]);
title('Standard Normal point cloud','FontSize',16,'FontWeight','Bold');
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold');


% to save plots please uncomment following lines
% print -painters -dpdf -r600 SMSscanorm3.pdf
% print -painters -dpng -r600 SMSscanorm3.png
