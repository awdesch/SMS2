clear all
close all
clc

%% load data and scaling
[type, A, B, C, D, E, F, G] = textread('food.dat','%s %f %f %f %f %f %f %f');
x                           = [A, B, C, D, E, F, G];
% scale data
y           = (((x')-repmat(mean(x),size(x,1),1)')./repmat(std(x),size(x,1),1)');

%% correlation matrix and interated principal factor method
r           = corr(y); % correlation matrix
r
niter       = 10;      % number of iterations
maxfactor   = 3;       % number of factors

[PFA.comm,PFA.floadings]    = factiter(r,niter,maxfactor);
%factor analysis - iterated principal factors method (PFM)
%number of iterations: 10, maximal number of factors to be extracted: 3

loadings                    = PFA.floadings;
loadings(:,3)               = loadings(:,3)*(-1); % correction for publication
communality                 = PFA.comm(11,:);
specific_variance           = 1-PFA.comm(11,:);
% table of final factor loadings, communalities and specific variance
b                           = [loadings,communality',specific_variance']
% rotating loadings using function varimax
varim                       = rotatefactors(loadings,'Method','varimax');

figure(1)
subplot(2,2,1)
a            = strvcat(type');
lab          = cellstr(a);
ucircle      = [cos((0:360)/180*3.14159)' , sin((0:360)/180*3.14159)'];
plot(ucircle(:,1),ucircle(:,2),'b:')
title('French food (varimax)','FontSize',16,'FontWeight','Bold')
ylim([-1.01,1.01])
xlim([-1.01,1.01])
xlabel('q_1','FontSize',16,'FontWeight','Bold')
ylabel('q_2','FontSize',16,'FontWeight','Bold')
line([0,0]',[-1.5,1.5]')
line([-1.5,1.5]',[0,0]')
text(varim(:,1)-0.1,varim(:,2),lab','FontSize',14)
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')

subplot(2,2,3)
plot(ucircle(:,1),ucircle(:,2),'b:')
title('French food (varimax)','FontSize',16,'FontWeight','Bold')
ylim([-1.01,1.01])
xlim([-1.01,1.01])
xlabel('q_1','FontSize',16,'FontWeight','Bold')
ylabel('q_3','FontSize',16,'FontWeight','Bold')
line([0,0]',[-1.5,1.5]')
line([-1.5,1.5]',[0,0]')
text(varim(:,1)-0.1,varim(:,3),lab','FontSize',14)
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')

subplot(2,2,4)
plot(ucircle(:,1),ucircle(:,2),'b:')
title('French food (varimax)','FontSize',16,'FontWeight','Bold')
ylim([-1.01,1.01])
xlim([-1.01,1.01])
xlabel('q_2','FontSize',16,'FontWeight','Bold')
ylabel('q_3','FontSize',16,'FontWeight','Bold')
line([0,0]',[-1.5,1.5]')
line([-1.5,1.5]',[0,0]')
text(varim(:,2)-0.1,varim(:,3),lab','FontSize',14)
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')


%manual rotation
theta1 = pi;
theta2 = 0.5;
theta3 = 1.5;
rot3   = [cos(theta3),sin(theta3),0;-sin(theta3),cos(theta3),0;0,0,1];
rot2   = [cos(theta2),0,sin(theta2);0,1,0;-sin(theta2),0,cos(theta2)];
rot1   = [1,0,0;0,cos(theta1),sin(theta1);0,(-sin(theta1)),cos(theta1)];
qr     = loadings*diag([1,-1,-1])*rot1*rot2*rot3

figure(2)
subplot(2,2,1)
plot(ucircle(:,1),ucircle(:,2),'b:')
title('French food','FontSize',16,'FontWeight','Bold')
ylim([-1.01,1.01])
xlim([-1.01,1.01])
xlabel('q_1','FontSize',16,'FontWeight','Bold')
ylabel('q_2','FontSize',16,'FontWeight','Bold')
line([0,0]',[-1.5,1.5]')
line([-1.5,1.5]',[0,0]')
text(qr(:,1)-0.1,qr(:,2),lab','FontSize',14)
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')

subplot(2,2,3)
plot(ucircle(:,1),ucircle(:,2),'b:')
title('French food','FontSize',16,'FontWeight','Bold')
ylim([-1.01,1.01])
xlim([-1.01,1.01])
xlabel('q_1','FontSize',16,'FontWeight','Bold')
ylabel('q_3','FontSize',16,'FontWeight','Bold')
line([0,0]',[-1.5,1.5]')
line([-1.5,1.5]',[0,0]')
text(qr(:,1)-0.1,qr(:,3),lab','FontSize',14)
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')

subplot(2,2,4)
plot(ucircle(:,1),ucircle(:,2),'b:')
title('French food','FontSize',16,'FontWeight','Bold')
ylim([-1.01,1.01])
xlim([-1.01,1.01])
xlabel('q_2','FontSize',16,'FontWeight','Bold')
ylabel('q_3','FontSize',16,'FontWeight','Bold')
line([0,0]',[-1.5,1.5]')
line([-1.5,1.5]',[0,0]')
text(qr(:,2)-0.1,qr(:,3),lab','FontSize',14)
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')