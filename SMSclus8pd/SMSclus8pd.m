% clear cache and close windows
clear all
close all
clc

%% example data set containing 8 points
eight  = [-3,-2,-2,-2,1,1,2,4;
          0,4,-1,-2,4,2,-4,-3]';
eight  = eight([8,7,3,1,4,2,6,5]',:);

%% cluster analysis employing ward algorithm
figure(1)
plot(eight,'w')
hold on
plot(eight(1:2,1),eight(1:2,2),'k','LineWidth',2)
plot(eight([2 5],1),eight([2 5],2),'k','LineWidth',2)
plot(eight([5 3],1),eight([5 3],2),'k','LineWidth',2)
plot(eight([3 4],1),eight([3 4],2),'k','LineWidth',2)
plot(eight([3 7],1),eight([3 7],2),'k','LineWidth',2)
plot(eight([7 8],1),eight([7 8],2),'k','LineWidth',2)
plot(eight([8 6],1),eight([8 6],2),'k','LineWidth',2)
lab = strvcat(num2str((1:8)'));
ylim([-4.2,4.2])
xlim([-4.4,4.4])
text(eight(:,1),eight(:,2),lab,'Color','r','FontSize',14)
xlabel('first coordinate','FontSize',16,'FontWeight','Bold')
ylabel('second coordinate','FontSize',16,'FontWeight','Bold')
title('8 points','FontSize',16,'FontWeight','Bold')
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')

%% single linkage for squared Euclidean distance matrix
% Draw line segments between pairs of points 
% euclidean distance matrix
d      = pdist(eight,'euclidean');

% squared euclidean distance matrix
dd     = d.^2;

% cluster analysis with ward algorithm                                                  
ss     = linkage(dd,'single');

% Dendrogram for the 8 data points after single linkage
figure(2)
subplot(1,2,1)
[H,T]  = dendrogram(ss,'colorthreshold','default');
set(H,'LineWidth',2)
title('Single Linkage Dendrogram - 8 points','FontSize',16,'FontWeight','Bold')
ylabel('Squared Euclidean Distance','FontSize',16,'FontWeight','Bold')
box on
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')

%% single linkage for Euclidean distance matrix
% Draw line segments between pairs of points 
% euclidean distance matrix
d      = pdist(eight,'euclidean');

% cluster analysis with ward algorithm                                                  
ss     = linkage(d,'single');

% Dendrogram for the 8 data points after single linkage
subplot(1,2,2)
[H,T]  = dendrogram(ss,'colorthreshold','default');
set(H,'LineWidth',2)
title('Single Linkage Dendrogram - 8 points','FontSize',16,'FontWeight','Bold')
ylabel('Squared Euclidean Distance','FontSize',16,'FontWeight','Bold')
box on
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')