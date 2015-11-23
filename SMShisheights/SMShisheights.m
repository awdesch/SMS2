clear all
close all
clc

% data
x = [1.72,1.83,1.74,1.79,1.94,1.71,1.66,1.60,1.78,1.77,1.85,1.70,1.76]';
origin = 1.6;
y = [origin:0.05:1.95]';
% plot histogram with breaks at each 5 cm from 1.6 meters height on
bar(y,histc(x,y),'BarWidth',1)
xlabel('height (m)','FontSize',16,'FontWeight','Bold')
xlim([1.55,1.95])
ylim([0,4.1])
title('Histogram of student heights','FontSize',16,'FontWeight','Bold')
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')
% to save the plot in pdf or png please uncomment next 2 lines:

 % print -painters -dpdf -r600 SMShisheights.pdf
 % print -painters -dpng -r600 SMShisheights.png