
% clear history
clear all
close all
clc

% load data
load annualpopu.dat

% extract specific variables
t      = annualpopu(10:19,2:3);

% standardization
[n m]  = size(t);
for i  = 1:n
    z(i,:) = (t(i,:)-mean(t))./sqrt((n-1)*var(t)/n);
end

% interval
x      = -pi:0.01:pi;

% data transformation for andrewslines
zt     = (t(1,1)/sqrt(2)+t(1,2)*sin(x)-42000)/100;

% plot
hold on
plot(x,zt,'LineWidth',2,'Color','k','LineStyle','-') 
for i = 1:5
    zt     = (t(i,1)/sqrt(2)+t(i,2).*sin(x)-42000)/100;
    plot(x,zt,'LineWidth',2,'Color','k','LineStyle','-')
end
for i = 6:10
    zt     = (t(i,1)/sqrt(2)+t(i,2).*sin(x)-42000)/100;
    plot(x,zt,'LineWidth',2,'Color','r','LineStyle',':')
end
title('Andrews curves (Annual population data)','FontSize',16,'FontWeight','Bold')
ylim([2,29])
xlim([-pi,pi])
ylabel('42000+Y*e2','FontSize',16,'FontWeight','Bold')
xlabel('X','FontSize',16,'FontWeight','Bold')
box on
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')
hold off

% to save plot please uncomment following lines 
% print -painters -dpng -r600 SMSandcurpopu.png
% print -painters -dpdf -r600 SMSandcurpopu.pdf
