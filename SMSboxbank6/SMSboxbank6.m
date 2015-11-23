clear all                     % clear variables
close all                     % close windows
clc                           % blank page

load bank2.dat                % load data

mu1 = mean(bank2(1:100,6));   % compute means for each group
mu2 = mean(bank2(101:200,6));

hold on                       % start plot by putting lines for mean
line([0.6 1.4],[mu1 mu1],'Color','k','LineStyle','--','LineWidth',2) % mean Genuine
line([1.6 2.4],[mu2 mu2],'Color','k','LineStyle','--','LineWidth',2) % mean Counterfeit
boxplot([bank2(1:100,6) bank2(101:200,6)],'Symbol','o','widths',0.8) % add boxplot
set(gca,'XTickLabel',{''},'FontSize',16,'FontWeight','Bold')         % clear x-axis ticks
title('Swiss Bank Notes','FontSize',16,'FontWeight','Bold')          % set title
xlabel(['Genuine                       Counterfeit'],'FontSize',16,'FontWeight','Bold')
box on
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')           % set frame
hold off

% to save plot please uncomment following lines 
% print -painters -dpng -r600 SMSboxbank6.png
% print -painters -dpdf -r600 SMSboxbank6.pdf