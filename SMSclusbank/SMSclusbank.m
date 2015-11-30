% clear variables and close graphics
clear all
close all
clc

%% load data and take sample
load('bank2.dat')

% set pseudo random numbers
RandStream.setGlobalStream(RandStream('mt19937ar','seed',100));

% sample n=20 out of the data set
bank2 = [(1:200)',bank2];    % set index variable
n     = 20;                  % sample size
bank  = datasample(bank2,n); % 20 randomly selected Swiss bank notes
lab   = strvcat(num2str(bank(:,1)));

%% principal component analysis
[coeff,score,latent]  = pca(bank(:,2:7));

% plot of scores
subplot(1,2,1)
plot(score(:,1),score(:,2),'w')
title('20 Swiss bank notes','FontSize',12,'FontWeight','Bold')
text(score(:,1),score(:,2),lab,'FontSize',14)
box on
set(gca,'LineWidth',1.6,'FontSize',12,'FontWeight','Bold')

%% ward method for squared Euclidean distance matrix
% Draw line segments between pairs of points 
d     = pdist(bank(:,2:7),'euclidean'); % euclidean distance matrix
dd    = d.^2;                     % squared euclidean distance matrix
ss    = linkage(dd,'ward');     % cluster analysis with ward algorithm 

% Dendrogram for the data points after ward linkage
subplot(1,2,2)
[H,T] = dendrogram(ss,'colorthreshold','default','Labels',lab);
set(H,'LineWidth',2)
title('Ward Dendrogram','FontSize',16,'FontWeight','Bold')
ylabel('Squared Euclidean Distance','FontSize',12,'FontWeight','Bold')
box on
set(gca,'LineWidth',1.6,'FontSize',12,'FontWeight','Bold')
