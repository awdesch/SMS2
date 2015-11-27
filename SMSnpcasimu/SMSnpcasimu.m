clear all
close all
clc

RandStream.setGlobalStream(RandStream('mt19937ar','seed',1));

u         = unifrnd(0,1,50,2);
a         = [1, 0, 1, 1
             0, 1, 1, -1];
  
x         = u * a;                     % generate the random data set

x         = zscore(x);                 % normalizing data
n         = size(x,1);
[v e]     = eigs(cov(x));              % spectral analysis
e         = diag(e);
tmp       = [e,v'];
e         = tmp(:,1);
v         = tmp(:,2:5)';
v(:,[1,4])= -v(:,[1,4]);               % sign correction for the book

disp('eigenvalues and proportions of explained variance');
disp([e , (e/sum(e)) , (cumsum(e)/sum(e))]');
disp('2 eigenvectors')
disp(v(:,1:2)');

y      = x * v;    % principal components
x12    = y(:,1:2);                  % first two PCs

figure(1)
subplot(1,2,1)                      % scatterplot of first two PCs
plot(x12(:,1),x12(:,2),'ob')
title('first  vs. second PC','FontSize',16,'FontWeight','Bold')
xlabel('PC 1','FontSize',16,'FontWeight','Bold')
ylabel('PC 2','FontSize',16,'FontWeight','Bold')
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')
box on
subplot(1,2,2)                      % screeplot of eigenvalues
bar(e)
ylim([0,2.5])
xlim([0,5])
title('eigenvalues of S','FontSize',16,'FontWeight','Bold')
ylabel('\lambda','FontSize',16,'FontWeight','Bold')
box on
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')


% To save plots uncomment following lines
% print -painters -dpdf -r600 SMSnpcasimu01.pdf
% print -painters -dpng -r600 SMSnpcasimu01.png


r       = corr([y,x]);
r       = r(5:8,1:2);                % correlations between variables and pc's
ucircle = [cos((0:360)/180*3.14159)',sin((0:360)/180*3.14159)'];
figure(2)
plot(ucircle(:,1),ucircle(:,2), '-w')
title('simulated data set','FontSize',16,'FontWeight','Bold')
xlabel('first PC','FontSize',16,'FontWeight','Bold')
ylabel('second PC','FontSize',16,'FontWeight','Bold')
hold on
xlim([-1.2 1.2])
ylim([-1.2 1.2])
line([-1.2 1.2],[0 0],'Color','k')
line([0 0],[1.2 -1.2],'Color','k')
line(ucircle(:,1),ucircle(:,2),'LineStyle',':','LineWidth',1.6);
plot(r(:,1),r(:,2),'ok');
text(r(:,1),r(:,2),  cellstr(strvcat('X1','X2','X3','X4')),'FontSize',16,'FontWeight','Bold')
box on
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')

% To save plots uncomment following lines
% print -painters -dpdf -r600 SMSnpcasimu02.pdf
% print -painters -dpng -r600 SMSnpcasimu02.png


