% Clear workspace
clear all
close all
clc

% principal components for US health data set
[rows,land_area,popu_1985,acc,card,canc,pul, pneu,diab,liv,doc,shop, reg, div] = ...
    textread('ushealth.dat','%s %f %f %f %f %f %f %f %f %f %f %f %f %f');
health  = horzcat(land_area,popu_1985,acc,card,canc,pul, pneu,diab,liv,doc,shop, reg, div); % Horizontal concatenation, creates data matrix
cols    = cellstr(strvcat('land_area','popu_1985','acc','card','canc','pul',...
          'pneu','diab','liv','doc','shop', 'reg', 'div'));

x       = health(:,3:9);

n       = size(x,1);
[v e]   = eig(cov(x));  % eigenvectors & eigenvalues
e       = diag(e);
v(:,2:7)= -v(:,2:7);
v       = fliplr(v);
e       = flipud(e);
disp('eigenvalues and proportions of explained variance')
disp([e]')
disp((e/sum(e))')
disp((cumsum(e)/sum(e))')

disp('2 eigenvectors')
disp(v(:,1:2))

y = x*v;   % primary components      

figure(1)  

plot(y(:,1),y(:,2),'wo')
title('first vs. second PC','FontSize',16,'FontWeight','Bold')
xlabel('PC 1','FontSize',16,'FontWeight','Bold')
ylabel('PC 2','FontSize',16,'FontWeight','Bold')
text(y(:,1),y(:,2),rows,'FontSize',16,'FontWeight','Bold')
box on
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')
xlim([min(y(:,1))-10,max(y(:,1))+30])

% To save plots uncomment following lines
% print -painters -dpdf -r600 SMSpcahealth01.pdf
% print -painters -dpng -r600 SMSpcahealth01.png

% screeplot
figure(2)
plot(1:7,e,'bo','LineWidth',1.6)
title('eigenvalues of S','FontSize',16,'FontWeight','Bold')
ylabel('\lambda','FontSize',16,'FontWeight','Bold')
box on
xlim([0,7])
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')

% To save plots uncomment following lines
% print -painters -dpdf -r600 SMSpcahealth02.pdf
% print -painters -dpng -r600 SMSpcahealth02.png

% correlation first two PCs with the original variables
r      = corr(y(:,1:2),x);

figure(3)
% plot of correlation first two PCs with the original variables
plot(cos((0:360)/180*3.14159)',sin((0:360)/180*3.14159)','b:','LineWidth',1.6)
title('US health','FontSize',16,'FontWeight','Bold')
xlabel('first PC','FontSize',16,'FontWeight','Bold')
ylabel('second PC','FontSize',16,'FontWeight','Bold')
box on
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')
text(r(1,:),r(2,:),cols(3:9),'FontSize',16,'FontWeight','Bold')
xlim([-1.1,1.1])
ylim([-1.1,1.1])
line([-1.2 1.2],[0 0],'Color','k')
line([0 0],[1.2 -1.2],'Color','k')

% To save plots uncomment following lines
% print -painters -dpdf -r600 SMSpcacarm03.pdf
% print -painters -dpng -r600 SMSpcacarm03.png

