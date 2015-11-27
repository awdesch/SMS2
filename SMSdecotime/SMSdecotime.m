
% delete history
clear all
close all
clc

% load data
time   = load('timebudget.dat');

% labels
cols   = cellstr(strvcat('prof','tran','hous','kids','shop','pers','eat','slee','tele','leis'));
rows   = cellstr(strvcat('maus','waus','wnus','mmus','wmus','msus','wsus','mawe','wawe','wnwe','mmwe','wmwe','mswe','wswe','mayo','wayo','wnyo','mmyo','wmyo','msyo','wsyo','maea','waea','wnea','mmea','wmea','msea','wsea'));

% retrieve dimensions
[n p]  = size(time);               % rows and columns of data matrix 

one    = ones(n,n);
h      = diag(ones(n,1))-one/n;    % centering matrix 
xs     = h*time;                   % centered data
xs     = xs/sqrt(n);               % correct for sample size
xs2    = xs'*xs; 
[xvec xval] = eig(xs2);            % spectral decomposition 
xval        = diag(xval);
[xval, ind] = sort(xval,'descend');% index eigenvalues by size
xvec        = xvec(:,ind);         % reorder eigenvectors according to eigenvalues
lambda = xval;                     % eigenvalues 
gamma  = xvec;                     % eigenvectors

w      = -(gamma'.*repmat(sqrt(abs(lambda)),1,p))'; % coordinates of activities 
w      = w(:,1:2);                       
z      = -xs*gamma;                % coordinates of individuals
z      = z(:,1:2);                       

tau    = cumsum(lambda)/sum(lambda)% percentage of explained variation

% visualization
subplot(2,1,1)
plot(w(:,1),w(:,2),'wo')
xlabel('w_1','FontSize',16,'FontWeight','Bold')
ylabel('w_2','FontSize',16,'FontWeight','Bold')
title('activities','FontSize',16,'FontWeight','Bold')
for i=1:p
text(w(i,1),w(i,2),cols(i),'FontSize',16, 'Color', 'blue')
end
line([0,0]',[-300,300]')
line([-300,300]',[0,0]')
axis([min(w(:,1))-10 max(w(:,1))+10  min(w(:,2))-10 max(w(:,2))+10]);
set(gca,'FontSize',16,'LineWidth',2,'FontWeight','bold')

subplot(2,1,2)
plot(z(:,1),z(:,2),'wo')
xlabel('z_1','FontSize',16,'FontWeight','Bold')
ylabel('z_2','FontSize',16,'FontWeight','Bold')
title('individuals','FontSize',16,'FontWeight','Bold')
for i=1:n
text(z(i,1),z(i,2),rows(i),'FontSize',16, 'Color', 'blue')
end
line([0,0]',[-300,300]')
line([-300,300]',[0,0]')
axis([min(z(:,1))-10 max(z(:,1))+10  min(z(:,2))-10 max(z(:,2))+10]);
set(gca,'FontSize',16,'LineWidth',2,'FontWeight','bold')
