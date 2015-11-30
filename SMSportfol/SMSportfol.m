%clear variables and close windows
clear all
close all
clc

% load data
load('nyse.dat')

% select portfolio
portfolio = nyse(:,[1,2,7]);

returns1 = portfolio*ones(1,3,1)'./3

subplot(2,1,1)
plot(returns1,'k-','LineWidth',2)
title('equally weighted portfolio','FontSize',16,'FontWeight','Bold')
box on
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')
xlabel('time','FontSize',16,'FontWeight','Bold')
ylabel('returns','FontSize',16,'FontWeight','Bold')
line([1,size(returns1,1)]',[0,0]','Color','k','LineWidth',1.6)
line([1,size(returns1,1)]',[-0.2,-0.2]','Color','k','LineWidth',1.6,'LineStyle',':')
line([1,size(returns1,1)]',[0.2,0.2]','Color','k','LineWidth',1.6,'LineStyle',':')


% optimal portfolio weights
opti = inv(cov(portfolio))*ones(1,3,1)';
opti = opti/sum(opti);

returns2 = portfolio*opti;
subplot(2,1,2)
plot(returns2,'k-','LineWidth',2)
title('variance efficient portfolio','FontSize',16,'FontWeight','Bold')
box on
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')
xlabel('time','FontSize',16,'FontWeight','Bold')
ylabel('returns','FontSize',16,'FontWeight','Bold')
line([1,size(returns2,1)]',[0,0]','Color','k','LineWidth',1.6)
line([1,size(returns2,1)]',[-0.2,-0.2]','Color','k','LineWidth',1.6,'LineStyle',':')
line([1,size(returns2,1)]',[0.2,0.2]','Color','k','LineWidth',1.6,'LineStyle',':')