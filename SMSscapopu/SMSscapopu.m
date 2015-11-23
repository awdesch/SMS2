% remove all variables and close all figures
clear all
close all
clc

%load data
load('annualpopu.dat')

Unemployed  = annualpopu(:,2); 
Inhabitants = annualpopu(:,3);

% scatterplot
plot(Unemployed,Inhabitants,'ob','LineWidth',2)
box on
title('Scatterplot','FontSize',16,'FontWeight','Bold')
xlabel('Inhabitants','FontSize',16,'FontWeight','Bold')
ylabel('Unemployment','FontSize',16,'FontWeight','Bold')
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')
hold off;