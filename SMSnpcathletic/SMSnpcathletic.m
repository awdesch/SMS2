% ----------------------------------------------------------------------------
% Book:		    SMS
% ----------------------------------------------------------------------------
% Quantlet:	    SMSnpcathletic
% ----------------------------------------------------------------------------
% Description:	SMSnpcathletic performs a normalized principal component
%               analysis for the athletic data set (athletic.mat) which
%               contains national athletic records of 55 countries in eight
%               disciplines (100m, 200m, 400m, 800m, 1500m, 5km, 10km and
%               marathon). Evidently, for different length of tracks
%               different times were measured. Thus, the data is normalized
%               before running the PC analysis. Eigenvalues, eigenvectors, 
%               screeplot, the first three principal components (PCs) and
%               the correlation of the first two PCs with the original
%               variables are shown as results.
% ----------------------------------------------------------------------------
% Keywords:     NPCA, PCA, principal components, scaling, transformation,
%               screeplot, random, simulation, uniform, random number
%               generation, normalization, multivariate, dimension
%               reduction, multi dimensional
% ----------------------------------------------------------------------------
% See also:     SMSpcacarm, SMSnpcathletic, SMSpcahealth, SMSnpcageopol,
%               SMSnpcasimu
% ----------------------------------------------------------------------------
% Usage:        -
% ----------------------------------------------------------------------------
% Inputs:       None
% ----------------------------------------------------------------------------
% Output:       Eigenvalues, eigenvectors, screeplot, the first three principal
%               components and the correlation of the first two PCs with 
%               the original variables are shown as results.
% ----------------------------------------------------------------------------
% Author:       Awdesch Melzer 20140505
% ----------------------------------------------------------------------------

% Clear workspace
clear all
close all
clc

load 'athletic.mat'                % load data

rows   = athletic.textdata(2:end,1); % row names
cols   = athletic.textdata(1,2:end); % column names

mat    = athletic.data;              % data set

% data transformation | normalizing
zmat   = (mat-repmat(mean(mat),size(mat,1),1))./repmat(sqrt(var(mat)),size(mat,1),1);

[COEFF,SCORE,latent,tsquare] = princomp(zmat);
pc1    = zmat*COEFF(:,1);
pc2    = zmat*COEFF(:,2);
pc3    = zmat*COEFF(:,3)*(-1);       % sign correction 


figure(1)

subplot(2,2,1)
plot(pc1,pc2,'wo')
xlabel('PC 1','FontSize',16,'FontWeight','Bold')
ylabel('PC 2','FontSize',16,'FontWeight','Bold')
title('first vs. second PC','FontSize',16,'FontWeight','Bold')
box on
xlim([min(min(pc1),min(pc2))-1,max(max(pc1),max(pc2))+1])
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')
text(pc1-1.7,pc2,rows,'FontSize',14,'FontWeight','Bold')

subplot(2,2,2)
plot(pc2,pc3,'wo')
xlabel('PC 2','FontSize',16,'FontWeight','Bold')
ylabel('PC 3','FontSize',16,'FontWeight','Bold')
title('second vs. third PC','FontSize',16,'FontWeight','Bold')
text(pc2-1,pc3,rows,'FontSize',14,'FontWeight','Bold')
xlim([min(min(pc2),min(pc3))-1,max(max(pc2),max(pc3))+1])
box on
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')

subplot(2,2,3)
plot(pc1,pc3,'wo')
xlabel('PC 1','FontSize',16,'FontWeight','Bold')
ylabel('PC 3','FontSize',16,'FontWeight','Bold')
title('first vs. third PC','FontSize',16,'FontWeight','Bold')
text(pc1-1.7,pc3,rows,'FontSize',14,'FontWeight','Bold')
xlim([min(min(pc1),min(pc3))-1,max(max(pc1),max(pc3))+1])
box on
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')

subplot(2,2,4)
[v e]   = eig(cov(zmat));
plot(1:8,sort(diag(e),'descend'),'bo','LineWidth',1.6)
title('eigenvalues of S','FontSize',16,'FontWeight','Bold')
ylabel('\lambda','FontSize',16,'FontWeight','Bold')
ylim([0,max(sort(diag(e),'descend'))+0.5])
box on
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')


% To save plots uncomment following lines
% print -painters -dpdf -r600 SMSnpcathletic01.pdf
% print -painters -dpng -r600 SMSnpcathletic01.png


cov1    = COEFF*diag(sqrt(latent));

figure(2)

plot(cov1(:,1),cov1(:,2),'wo')
xlabel('first PC','FontSize',16,'FontWeight','Bold')
ylabel('second PC','FontSize',16,'FontWeight','Bold')
xlim([-1.1,1.1])
ylim([-1.1,1.1])
title('Athletic records','FontSize',16,'FontWeight','Bold')
text(cov1(:,1)-0.05,cov1(:,2),cols,'FontSize',16,'FontWeight','Bold')
line([-1.2 1.2],[0 0],'Color','k')
line([0 0],[1.2 -1.2],'Color','k')
ucircle = [cos((0:360)/180*3.14159)',sin((0:360)/180*3.14159)'];
line(ucircle(:,1),ucircle(:,2),'LineStyle',':','LineWidth',1.6);
box on
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')


disp('eigenvalues')
disp(sort(diag(e),'descend'))
disp('1st eigenvector')
disp(COEFF(:,1))
disp('2nd eigenvector')
disp(COEFF(:,2))


% To save plots uncomment following lines
% print -painters -dpdf -r600 SMSnpcathletic02.pdf
% print -painters -dpng -r600 SMSnpcathletic02.png