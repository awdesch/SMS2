% Clear workspace
clear all
close all
clc


% Load data set
load uscrime.dat


% Principal component analysis
pc = uscrime(:, [3:9]);
[COEFF,SCORE,latent,tsquare] = princomp(zscore(pc));

COEFF(:,2) = -COEFF(:,2);
SCORE(:,2) = -SCORE(:,2);

% Eigenvalues of the variance matrix
latent

Markers= ['s','s','s','s','s','s','s','s','s',...
 'o','o','o','o','o','o','o','o','o','o','o','o',...
 '^','^','^','^','^','^','^','^','^','^','^','^','^','^','^','^',...
 'x','x','x','x','x','x','x','x','x','x','x','x','x'];

figure(1)
for i=1:size(SCORE,1)
    
plot(SCORE(i,1),SCORE(i,2),Markers(i),'Color','k','MarkerSize',10)
hold on
end
box on
xlabel('PC1','FontSize',16,'FontWeight','Bold')
ylabel('PC2','FontSize',16,'FontWeight','Bold')
title('first vs. second PC','FontSize',16,'FontWeight','Bold')
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')


% To save plots uncomment following lines
% print -painters -dpdf -r600 SMSnpcacrime1.pdf
% print -painters -dpng -r600 SMSnpcacrime1.png

SCORE(:, [8]) = uscrime(:, [10]);
ucircle       = [cos((0:360)/180*3.14159)',sin((0:360)/180*3.14159)'];

% Screeplot
figure(2);
bar(latent, 'k')
title('pccrime','FontSize',16,'FontWeight','Bold')
xlabel('Components','FontSize',16,'FontWeight','Bold')
ylabel('Eigenvalues','FontSize',16,'FontWeight','Bold')
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')
axis square


% To save plots uncomment following lines
% print -painters -dpdf -r600 SMSnpcacrime2.pdf
% print -painters -dpng -r600 SMSnpcacrime2.png


a       = strvcat('ME', 'NH', 'VT', 'MA', 'RI', 'CT', 'NY', 'NJ', 'PA', 'OH','IN', 'IL', 'MI', 'WI', 'MN', 'IA', 'MO', 'ND', 'SD', 'NE', 'KS', 'DE', 'MD', 'VA', 'MV', 'NC', 'SC', 'GA', 'FL', 'KY', 'TN', 'AL','MS', 'AR','LA', 'OK', 'TX', 'MT', 'ID', 'WY', 'CO', 'NM', 'AZ', 'UT', 'NV', 'WA', 'OR', 'CA', 'AK', 'HI');
OBSLABS = cellstr(a);
b       = strvcat('Murder', 'Rape', 'Robbery', 'Assault', 'Burglary', 'Larceny', 'Autotheft') ;
VARLABS = cellstr(b);


% Correlation of PCs with original variables
figure(3);
plot(ucircle(:, [1]), ucircle(:, [2]), '-- k')
axis([-1.1, 1.1, -1.1, 1.1])
cors = COEFF * diag(sqrt(latent));
text(cors(:, [1]), cors(:, [2]), VARLABS,'FontSize',16,'FontWeight','Bold') 
hold on
x=[1,1];
y=[1,1];
plot(x, y)
xlim([-1.2 1.2])
ylim([-1.2 1.2])
line([-1.2 1.2],[0 0],'Color','k')
line([0 0],[1.2 -1.2],'Color','k')
box on
title('US crime','FontSize',16,'FontWeight','Bold')
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')
xlabel('frist PC','FontSize',16,'FontWeight','Bold')
ylabel('second PC','FontSize',16,'FontWeight','Bold')
axis square

% To save plots uncomment following lines
% print -painters -dpdf -r600 SMSnpcacrime3.pdf
% print -painters -dpng -r600 SMSnpcacrime3.png




