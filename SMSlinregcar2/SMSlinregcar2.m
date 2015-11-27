 % clear variables and close windows
clear all
close all
clc

 % load data
load('carc.txt')

Mileage      = carc(:,2);
Weight       = carc(:,8);
Displacement = carc(:,11);
Origin       = carc(:,13);
Price        = carc(:,1);

% linear model with origin
lm3 = GeneralizedLinearModel.fit([log(Weight), Origin],log(Mileage),'CategoricalVars',[2])

 % interaction is not significant
T = [0 0 0;1 0 0;1 1 0;0 1 0]; % interaction matrix
lm3int = GeneralizedLinearModel.fit([log(Weight), Origin],log(Mileage),T,'CategoricalVars',[2])

hold on
gscatter(log(Weight),log(Mileage),Origin,'rbg','so^',8)
box on
c3     = lm3int.Coefficients.Estimate;
x=linspace(min(log(Weight)),max(log(Weight)),100);
line(x , c3(1)+c3(2)*x,'Color','r','LineWidth',1.6) % US
line(x,(c3(1)+c3(5))+(c3(2)+c3(3))*x,'LineStyle',':', 'Color','b','LineWidth',1.6) % Japan
line(x,(c3(1)+c3(6))+(c3(2)+c3(4))*x,'LineStyle','--','Color','g','LineWidth',1.6) % Europe
xlabel('log(Weight)','FontSize',16,'FontWeight','Bold')
ylabel('log(Mileage)','FontSize',16,'FontWeight','Bold')
xlim([7.4,8.6])
set(gca,'FontSize',16,'LineWidth',2,'FontWeight','bold')
hold off
legend off

 % print -painters -dpdf -r600 SMSlinregcar2.pdf
 % print -painters -dpng -r600 SMSlinregcar2.png