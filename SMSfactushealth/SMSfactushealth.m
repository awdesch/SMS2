clear all
close all
clc

% load data
[rows,land_area,popu_1985,acc,card,canc,pul, pneu,diab,liv,doc,shop, reg, div] = ...
    textread('ushealth.dat','%s %f %f %f %f %f %f %f %f %f %f %f %f %f');
health  = horzcat(land_area,popu_1985,acc,card,canc,pul, pneu,diab,liv,doc,shop, reg, div); % Horizontal concatenation, creates data matrix
x       = health(:,3:9);

% perform factor analysis employing varimax rotation method
[lambda,psi,T,stats,F] = factoran(x,3,'rotate','varimax','scores','regression')
facttable = [lambda, (1 - psi), psi];
format bank
disp('          q1            q2            q3            Communalities  Specific variances')
disp(facttable)
format short

% labels
lab = strvcat('acc', 'card', 'canc', 'pul', 'pneu', 'diab', 'liv');
lab = cellstr(lab);

% unit circle
ucircle      = [cos((0:360)/180*3.14159)' , sin((0:360)/180*3.14159)'];

% correlation plots of factor loadings with original variables
figure(1)
subplot(2,2,1)
plot(ucircle(:,1),ucircle(:,2),'b:','LineWidth',1.6)
title('US health (varimax)','FontSize',16,'FontWeight','Bold')
ylim([-1.01,1.01])
xlim([-1.01,1.01])
xlabel('q_1','FontSize',16,'FontWeight','Bold')
ylabel('q_2','FontSize',16,'FontWeight','Bold')
line([0,0]',[-1.5,1.5]','LineWidth',1.6)
line([-1.5,1.5]',[0,0]','LineWidth',1.6)
text(lambda(:,1)-0.2,lambda(:,2),lab,'FontSize',14)
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')

subplot(2,2,3)
plot(ucircle(:,1),ucircle(:,2),'b:','LineWidth',1.6)
title('US health (varimax)','FontSize',16,'FontWeight','Bold')
ylim([-1.01,1.01])
xlim([-1.01,1.01])
xlabel('q_1','FontSize',16,'FontWeight','Bold')
ylabel('q_3','FontSize',16,'FontWeight','Bold')
line([0,0]',[-1.5,1.5]','LineWidth',1.6)
line([-1.5,1.5]',[0,0]','LineWidth',1.6)
text(lambda(:,1)-0.2,lambda(:,3),lab,'FontSize',14)
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')

subplot(2,2,4)
plot(ucircle(:,1),ucircle(:,2),'b:','LineWidth',1.6)
title('US health (varimax)','FontSize',16,'FontWeight','Bold')
ylim([-1.01,1.01])
xlim([-1.01,1.01])
xlabel('q_2','FontSize',16,'FontWeight','Bold')
ylabel('q_3','FontSize',16,'FontWeight','Bold')
line([0,0]',[-1.5,1.5]','LineWidth',1.6)
line([-1.5,1.5]',[0,0]','LineWidth',1.6)
text(lambda(:,2)-0.2,lambda(:,3),lab,'FontSize',14)
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')

% factor scores
% labels for regions
state     = strvcat('ME','NH','VT','MA','RI','CT','NY','NJ','PA','OH','IN','IL','MI','WI','MN','IA','MO','ND','SD','NE','KS','DE','MD','VA','VW','NC','SC','GA','FL','KY','TN','AL','MS','AR','LA','OK','TX','MT','ID','WY','CO','NM','AZ','UT','NV','WA','OR','CA','AK','HI');
state     = cellstr(state);

% markers for factor scores plot
Markers= ['s','s','s','s','s','s','s','s','s',...
 'o','o','o','o','o','o','o','o','o','o','o','o',...
 '^','^','^','^','^','^','^','^','^','^','^','^','^','^','^','^',...
 'x','x','x','x','x','x','x','x','x','x','x','x','x'];
%  color of markers for factor scores plot
Colors = ['k','k','k','k','k','k','k','k','k',...
 'r','r','r','r','r','r','r','r','r','r','r','r',...
 'g','g','g','g','g','g','g','g','g','g','g','g','g','g','g','g',...
 'b','b','b','b','b','b','b','b','b','b','b','b','b'];

% factor scores plot
figure(2)
subplot(2,2,1)
for i=1:size(F,1)
plot(F(i,1),F(i,2),Markers(i),'Color',Colors(i),'MarkerSize',10)
hold on
text(F(i,1)+0.15,F(i,2),state(i),'Color',Colors(i),'FontSize',14)
end
title('US health (factor scores)','FontSize',16,'FontWeight','Bold')
xlabel('f_1','FontSize',16,'FontWeight','Bold')
ylabel('f_2','FontSize',16,'FontWeight','Bold')
line([0,0]',[-2,3]','LineWidth',1.6)
line([-4,4]',[0,0]','LineWidth',1.6)
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')
hold off

subplot(2,2,3)
for i=1:size(F,1)
plot(F(i,1),F(i,3),Markers(i),'Color',Colors(i),'MarkerSize',10)
hold on
text(F(i,1)+0.15,F(i,3),state(i),'Color',Colors(i),'FontSize',14)
end
title('US health (factor scores)','FontSize',16,'FontWeight','Bold')
xlabel('f_1','FontSize',16,'FontWeight','Bold')
ylabel('f_3','FontSize',16,'FontWeight','Bold')
line([0,0]',[-2,3]','LineWidth',1.6)
line([-4,4]',[0,0]','LineWidth',1.6)
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')

subplot(2,2,4)
for i=1:size(F,1)
plot(F(i,2),F(i,3),Markers(i),'Color',Colors(i),'MarkerSize',10)
hold on
text(F(i,2)+0.15,F(i,3),state(i),'Color',Colors(i),'FontSize',14)
end
title('US health (factor scores)','FontSize',16,'FontWeight','Bold')
xlabel('f_2','FontSize',16,'FontWeight','Bold')
ylabel('f_3','FontSize',16,'FontWeight','Bold')
line([0,0]',[-2,3]','LineWidth',1.6)
line([-4,4]',[0,0]','LineWidth',1.6)
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')
