clear all
close all
clc

x           = load('bank2.dat'); % load data

% scale data
y           = (((x)-repmat(mean(x),size(x,1),1))./repmat(std(x),size(x,1),1));
r           = corr(y); % correlation matrix
r
niter       = 10;      % number of iterations
maxfactor   = 2;       % number of factors

[PFA.comm, PFA.floadings]  = factiter(r,niter,maxfactor);
%factor analysis - iterated principal factors method (PFM)
%number of iterations: 10, maximal number of factors to be extracted: 2
loadings     = PFA.floadings;
loadings(:,2)=loadings(:,2).*(-1); % correcion for publication
communality  = PFA.comm(11,:);
spec_var     = 1-PFA.comm(11,:);
% table of loadings, communalities and specific variance
b            = [loadings,communality',spec_var']

%% plot
subplot(1,2,1) % correlation of original loadings with variables
a            = strvcat('Length','Height Left','Height Right','Inner Frame Lower','Inner Frame Upper','Diagonal');
lab          = cellstr(a);
ucircle      = [cos((0:360)/180*3.14159)' , sin((0:360)/180*3.14159)'];
plot(ucircle(:,1),ucircle(:,2),'b:')
ylim([-1.01,1.01])
xlim([-1.01,1.01])
title('Swiss bank notes (loadings)','FontSize',16,'FontWeight','Bold')
xlabel('q_1','FontSize',16,'FontWeight','Bold')
ylabel('q_2','FontSize',16,'FontWeight','Bold')
line([0,0]',[-1.5,1.5]')
line([-1.5,1.5]',[0,0]')
text(loadings(:,1)-0.1,loadings(:,2),lab,'FontSize',14)
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')


%% manual rotation
theta        = pi*7/12;
rot          = [[cos(theta);sin(theta)],[-sin(theta);cos(theta)]]';
qr           = loadings*rot;

subplot(1,2,2) % correlation of rotated loadings with variables
plot(ucircle(:,1),ucircle(:,2),'b:')
title('Swiss bank notes (rotation)','FontSize',16,'FontWeight','Bold')
xlabel('q_1','FontSize',16,'FontWeight','Bold')
ylabel('q_2','FontSize',16,'FontWeight','Bold')
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')
line([0,0]',[-1.5,1.5]')
line([-1.5,1.5]',[0,0]')
text(qr(:,1)-0.1,qr(:,2),lab,'FontSize',14)
ylim([-1.01,1.01])
xlim([-1.01,1.01])

