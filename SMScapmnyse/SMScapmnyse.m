% Clear variables and close windows
clear all
close all
clc

load('nyse.dat')
% IBM PanAm Delta Edison Gerber Texaco DEC
pi = LinearModel.fit(nyse(:,1),nyse(:,2));				    %linear models
bp = pi.Coefficients.Estimate;
t  = -0.2:0.05:0.2;

di = LinearModel.fit(nyse(:,7),nyse(:,2));
bd = di.Coefficients.Estimate;


subplot(1,2,1) %plot of the results
plot(nyse(:,1),nyse(:,2),'bo')
title('PanAm vs. IBM','FontSize',16,'FontWeight','Bold')
box on
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')
xlim([-0.19,0.19])
ylim([-0.41,0.41])
line(t,bp(1)+bp(2)*t,'Color','k', 'LineWidth',1.5)
subplot(1,2,2)
plot(nyse(:,1),nyse(:,7),'bo')
title('DEC vs. IBM','FontSize',16,'FontWeight','Bold')
box on
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')
xlim([-0.19,0.19])
ylim([-0.41,0.41])
line(t,bd(1)+bd(2)*t,'Color','k', 'LineWidth',1.5)