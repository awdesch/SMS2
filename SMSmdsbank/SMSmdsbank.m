% clear variables and close windows
clear all
close all
clc

% load data
load('bank2.dat')

counter = cellstr(strvcat([repmat('G',100,1);repmat('F',100,1)]));
% main calculation
sol     = mdscale(dist(bank2'),2);
cor     = corr([sol,bank2]);
cor     = cor(3:8,1:2);
cor     = cor(:,1:2).*(-1);
sol     = sol(:,1:2).*(-1);

% plot of coordinates
figure(1)
subplot(1,2,1)
plot(sol(:,1),sol(:,2),'wo')
xlabel('x_1','FontSize',16,'FontWeight','Bold')
ylabel('x_2','FontSize',16,'FontWeight','Bold')
title('metric MDS','FontSize',16,'FontWeight','Bold')
text(sol(1:100,1), sol(1:100,2),counter(1:100),'Color','k','FontSize',16,'FontWeight','Bold')
text(sol(101:200,1), sol(101:200,2),counter(101:200),'Color','r','FontSize',16,'FontWeight','Bold')
box on
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')

names   = cellstr(strvcat('Length','Height Left','Height Right',...
'Inner Frame Lower','Inner Frame Upper', 'Diagonal'));
ucircle = [cos((0:360)/180*3.14159)' , sin((0:360)/180*3.14159)'];
% plot of correlations of mds with original variables
subplot(1,2,2)
plot(ucircle(:,1),ucircle(:,2),'b:','LineWidth',1.6)
title('correlations','FontSize',16,'FontWeight','Bold')
xlabel('x_1','FontSize',16,'FontWeight','Bold')
ylabel('x_2','FontSize',16,'FontWeight','Bold')
ylim([-1.01,1.01])
xlim([-1.01,1.01])
line([0,0]',[-1.5,1.5]','LineWidth',1.6)
line([-1.5,1.5]',[0,0]','LineWidth',1.6)
text(cor(:,1)-0.2,cor(:,2),names,'FontSize',14)
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')
