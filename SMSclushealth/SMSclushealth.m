clear all
close all
clc

[rows,land_area,popu_1985,acc,card,canc,pul, pneu,diab,liv,doc,shop, reg, div] = ...
    textread('ushealth.dat','%s %f %f %f %f %f %f %f %f %f %f %f %f %f');
health  = horzcat(land_area,popu_1985,acc,card,canc,pul, pneu,diab,liv,doc,shop, reg, div); % Horizontal concatenation, creates data matrix
x       = health(:,3:9);
n       = size(x,1);        % number of observations
% labels for deseases
lab     = strvcat('acc', 'card', 'canc', 'pul', 'pneu', 'diab', 'liv');
lab     = cellstr(lab);
% labels for regions
state   = strcat(rows,num2str(health(:,12)));
state   = cellstr(state);

%% ward method for chi squared distance matrix
% Draw line segments between pairs of points 
d         = dist(x');  % Euclidean distance
ss        = linkage(d,'ward');     % cluster analysis with ward algorithm 

% Dendrogram for the data points after ward linkage
figure(1)
[H,T] = dendrogram(ss,n,'colorthreshold',1200,'Orientation','left','Labels',state);
set(H,'LineWidth',2)
title('Ward dendrogram for US health','FontSize',16,'FontWeight','Bold')
ylabel('Euclidean Distance','FontSize',12,'FontWeight','Bold')
box on
set(gca,'LineWidth',1.6,'FontSize',8,'FontWeight','Bold')
clus      = 4;
gpoints   = cluster(ss,'maxclust',clus);
gmean     = zeros(clus,size(x,2));
for i=1:clus
   g          = find(gpoints==i);
   gmean(i,:) = mean(x(g,:));
end

% Colors for Sectors
colour = ones(3,n);
for i=1:n
    if(gpoints(i)==1)
    colour(:,i) = [1, 0.7, 0.3]';
    end
    if(gpoints(i)==2)
    colour(:,i) = [0.4, 0, 1]';
    end
    if(gpoints(i)==3)
    colour(:,i) = [0, 0.7, 0.5]';
    end
    if(gpoints(i)==4)
    colour(:,i) = [1, 0, 0.4]';
    end
end
%% pca
[COEFF,score,latent,tsquare] = princomp(x);

figure(2)
 plot(score(:,1),score(:,2),'w')
 title('US crimes: four clusters','FontSize',16,'FontWeight','Bold')
 xlabel('PC1','FontSize',16,'FontWeight','Bold')
 ylabel('PC2','FontSize',16,'FontWeight','Bold')
 hold on
 for i=1:n
     text(score(i,1),score(i,2),state(i),'Color',colour(:,i),'FontSize',14)
 end
 box on
 set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')

%% table of means in five clusters
disp('Cluster means for each variable (columns) and each cluster (rows)')
disp(lab')
disp(gmean)
