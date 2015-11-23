% remove variables and close windows
clear all
close all
clc

% load data
load bank2.dat

bank     = bank2(:,6);                                    % sixth column (X6)
x1       = bank(1:100);                                   % genuine bank notes
x2       = bank(101:200);                                 % counterfeit bank notes
h_opt    = [std(x1),std(x2)].*size(x1,1).^(-1/5).*1.06;   % Silverman's rule of thumb

% density estimates
[x1 fh1] = ksdensity(x1,'width',h_opt(1)); % kernel density estimation for the diagonal of 
% genuine bank notes
[x2 fh2] = ksdensity(x2,'width',h_opt(2)); % kernel density estimation for the diagonal of
% counterfeit bank notes

% plot
hold on
plot(fh1,x1,'LineWidth',2,'Color','k')
xlabel('counterfeit/genuine','FontSize',16,'FontWeight','Bold')
ylabel('density estimates for diagonals','FontSize',16,'FontWeight','Bold')
title('Swiss bank notes','FontSize',16,'FontWeight','Bold')
box on
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')
plot(fh2,x2,'LineWidth',2,'Color','r','LineStyle','-.')
hold off

% to save plot please uncomment following lines 
% print -painters -dpng -r600 SMSdenbank.png
% print -painters -dpdf -r600 SMSdenbank.pdf