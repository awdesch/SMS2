
clear all
close all
clc

x   = [2 3 4 2.8 3]';
xx  = [1.5 2 1.5 2 2.2]';
obs = [1:5]';
xp  = [obs,x];
xxp = [obs,xx];

plot(xp(:,1),xp(:,2), 'r-','LineWidth',2)
hold on
plot(xxp(:,1),xxp(:,2), 'b-','LineWidth',2)

tx  = [4.3,max(x(4:5))];
txx = [4.3,max(xx(4:5))];
text(tx(1),tx(2),'Group1','Color','red','FontSize',14)
text(txx(1),txx(2),'Group2','Color','blue','FontSize',14)
title('Population profiles', 'FontSize',16,'FontWeight','Bold')
ylabel('Mean','FontSize',16,'FontWeight','Bold')
xlabel('Treatment','FontSize',16,'FontWeight','Bold')
ylim([min(min(x,xx))-0.1,max(max(x,xx))+0.1])
set(gca,'LineWidth',1.6)
box on
hold off


% To save the plots as pdf and png, please, uncomment the following lines
% print -painters -dpng -r600 SMSprofil.png
% print -painters -dpdf -r600 SMSprofil.pdf

