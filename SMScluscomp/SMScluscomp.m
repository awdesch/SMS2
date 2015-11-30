clear all
close all
clc

%% load data and transformation

[Names,Assets,Sales,MarketValue,Profits,CashFlow,Employees,Sector] = textread('uscomp2.dat','%s %f %f %f %f %f %f %s');
data       = [Assets,Sales,MarketValue,Profits,CashFlow,Employees];
colnames   = cellstr(strvcat('Assets','Sales','Market Value','Profits','Cash Flow','Employees','Sector'));
Names      = cellstr(strvcat(Names));
n          = size(data,1);           % sample size
meanx      = mean(data);             % column means
x          = data-repmat(meanx,n,1); % centering
minx       = min(data);              % column minimum
maxx       = max(data);              % column maximum
varx       = var(data);              % column variance
xp         = zeros(size(data));      % empty matrix
for (i = 1:n)                       % transformation procedure
xp(i,:)    = log(data(i,:)-minx+(maxx-minx)./200); 
end
sxx        = repmat(sqrt(varx),n,1);% matrix of std deviation

%% pca
[ve, va]   = eig(cov(xp));           % eigensystem analysis
va         = diag(va);               % retrieve from diagonal
[va, ind]  = sort(va,'descend');     % sort in decresing order, index
ve         = ve(:,ind);              % sorting vectors according to index
ve(:,[3,4])= -ve(:,[3,4]);
y          = xp*ve;                  % PCA transformation
y          = y(:,1:2);
y2         = y;
tc         = ones(n,1);

%% Plot 1
figure(1)
plot(y(:,1),y(:,2),'w')
xlabel('PC1','FontSize',16,'FontWeight','Bold')
ylabel('PC2','FontSize',16,'FontWeight','Bold')
title('US companies','FontSize',16,'FontWeight','Bold')
text(y(:,1),y(:,2),Names,'FontSize',14)
box on
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')

%% ward method L1 distance matrix
% Draw line segments between pairs of points 
d          = pdist(xp,'cityblock'); % L1 distance
ss         = linkage(d,'ward');     % cluster analysis with ward algorithm 

% Dendrogram for the data points after ward linkage
sect       = cellstr(strvcat(Sector));
figure(2)
[H,T] = dendrogram(ss,n,'colorthreshold',15,'Orientation','left','Labels',Names);
set(H,'LineWidth',2)
title('Ward dendrogram for US companies','FontSize',16,'FontWeight','Bold')
ylabel('L_1 Distance','FontSize',12,'FontWeight','Bold')
box on
set(gca,'LineWidth',1.6,'FontSize',8,'FontWeight','Bold')

%% clusters and principal components
gpoints    = cluster(ss,'maxclust',5);


% markers for components plot
Marker  = strvcat(Sector);
Marker  = Marker(:,1);

i1      = find(gpoints==1);
i2      = find(gpoints==2);
i3      = find(gpoints==3);
i4      = find(gpoints==4);
i5      = find(gpoints==5);

Marker(i1,:) = 'd';
Marker(i2,:) = 'o';
Marker(i3,:) = '+';
Marker(i4,:) = '^';
Marker(i5,:) = 'x';

% Colors for Sectors
Sectors  =  [1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3 3 3 3 3 ...
    3 3 3 3 4 4 4 4 4 4 4 4 5 5 5 5 5 5 5 5 5 5 6 6 6 6 7 7 7 7 7 7 7 ...
    8 8 8 8 8 8 8 8 8 8 9 9 9 9 9 9]';

colour = ones(3,n);
for i=1:n
    
    if(Sectors(i)==1)
    colour(:,i) = [0, 0.4, 1]';
    end
    if(Sectors(i)==2)
    colour(:,i) = [0, 0, 1]';
    end
    if(Sectors(i)==3)
    colour(:,i) = [0, 1, 0.6]';
    end
    if(Sectors(i)==4)
    colour(:,i) = [1, 0, 0]';
    end
    if(Sectors(i)==5)
    colour(:,i) = [0, 0, 0]';
    end
    if(Sectors(i)==6)
    colour(:,i) = [1, 0.4, 0]';
    end
    if(Sectors(i)==7)
    colour(:,i) = [1, 0.2, 0.2]';
    end
    if(Sectors(i)==8)
    colour(:,i) = [0.5, 0.4, 0]';
    end
    if(Sectors(i)==9)
    colour(:,i) = [0, 0.4, 0.6]';
    end
    end

% show the clusters 
figure(3)
 plot(y2(:,1),y2(:,2),'w')
 title('US companies: five clusters','FontSize',16,'FontWeight','Bold')
 xlabel('PC1','FontSize',16,'FontWeight','Bold')
 ylabel('PC2','FontSize',16,'FontWeight','Bold')
 hold on
 for i=1:n
 plot(y2(i,1),y2(i,2),Marker(i),'Color','k','MarkerSize',10)
 text(y2(i,1)+0.15,y2(i,2),Sector(i),'Color',colour(:,i),'FontSize',14)
 end
 box on
 set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')

