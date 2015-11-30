% clear variables and close windows
clear all
close all
clc

% variables
desc = cellstr(strvcat('Nissan','Kia','BMW','Audi'));
%D = cbind(c(0,2,4,3),c(2,0,6,5),c(4,6,0,1),c(3,5,1,0))
D = [[0,2,5,3]',[2,0,6,4]',[5,6,0,1]',[3,4,1,0]'];
D

% main calculation
[Y,stress,disparities] = mdscale(D,2,'criterion','stress')

% 2D map
plot(Y(:,1),Y(:,2),'wo')
xlabel('x_1','FontSize',16,'FontWeight','Bold')
ylabel('x_2','FontSize',16,'FontWeight','Bold')
xlim([-4,4])
ylim([-4,4])
title('nonmetric MDS','FontSize',16,'FontWeight','Bold')
text(Y(:,1),Y(:,2),desc,'color','b','FontSize',16,'FontWeight','Bold')
box on
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')

dist(Y)