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
color = ones(3,200);         % setting color
i     = 0;
while (i<=200)
    i = i + 1;
    if(i<101)
        color(:,i) = [1, 0, 0]';            % red
    end
    if(i>100)
        color(:,i) = [0, 0, 0]';            % black
    end
end
color = color(:,bank(:,1));  % sample colors

%% principal component analysis
[coeff,score,latent]  = pca(bank(:,2:7));

% plot of scores
subplot(1,2,1)
plot(score(:,1),score(:,2),'w')
title('20 Swiss bank notes','FontSize',16,'FontWeight','Bold')
hold on
for(i = 1:n)
text(score(i,1),score(i,2),lab(i,:),'Color',color(:,i),'FontSize',14)
end
xlabel('PC1','FontSize',12,'FontWeight','Bold')
ylabel('PC2','FontSize',12,'FontWeight','Bold')
box on
set(gca,'LineWidth',1.6,'FontSize',12,'FontWeight','Bold')

%% ward method for L1 distance matrix
% Draw line segments between pairs of points 
d     = pdist(bank(:,2:7),'cityblock'); % L1 distance
ss    = linkage(d,'ward');     % cluster analysis with ward algorithm 

% Dendrogram for the data points after ward linkage
subplot(1,2,2)
[H,T] = dendrogram(ss,'colorthreshold','default','Labels',lab);
set(H,'LineWidth',2)
title('Ward Dendrogram','FontSize',16,'FontWeight','Bold')
ylabel('L_1 Distance','FontSize',12,'FontWeight','Bold')
box on
set(gca,'LineWidth',1.6,'FontSize',12,'FontWeight','Bold')
