% Clear workspace
clear all
close all
clc

% PCA similar to Ex. 11.3

[type, economy, service, value, price, design, sporty, safety, handling] = textread('carmean2.dat','%s %f %f %f %f %f %f %f %f');
cars1  = horzcat(economy, service, value, price, design, sporty, safety, handling); % Horizontal concatenation, creates data matrix

% labels for plotting PCAs
rows   = cellstr(strvcat('Audi','BMW','Citroen','Ferrari','Fiat',...
    'Ford','Hyundai','Jaguar','Lada','Mazda','Mercedes','Mitsubishi',...
    'Nissan','Opel Corsa','Opel Vectra','Peugeot','Renault','Rover',...
    'Toyota','Trabant','VW Golf','VW Passat','Wartburg'));
% labels for plotting correlation
cols   = cellstr(strvcat('Economy', 'Service', 'Value', 'Price', 'Design',...
    'Sporty', 'Safety', 'Easy'));
x      = cars1;

n      = size(x,1);
[v e]  = eig(cov(x));  % eigenvectors & eigenvalues
e      = diag(e);
v      = fliplr(v);
e      = flipud(e);
v(:,[1,3,7,8])=-v(:,[1,3,7,8]);
disp('eigenvalues and proportions of explained variance')
disp([e,(e/sum(e)),(cumsum(e)/sum(e))]')

disp('2 eigenvectors')
disp(v(:,1:2))

figure(1)

y = x*v;   % primary components

 % plot first three primary components in pairs against each other
subplot(2,2,1)
plot(y(:,1),y(:,2),'wo')
title('first vs. second PC','FontSize',16,'FontWeight','Bold')
xlabel('PC 1','FontSize',16,'FontWeight','Bold')
ylabel('PC 2','FontSize',16,'FontWeight','Bold')
text(y(:,1),y(:,2),rows,'FontSize',14,'FontWeight','Bold')
box on
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')
xlim([min(min(y(:,1)),min(y(:,2)))-1,max(max(y(:,1)),max(y(:,2)))+1])


subplot(2,2,2)
plot(y(:,2),y(:,3),'wo')
title('second vs. third PC','FontSize',16,'FontWeight','Bold')
xlabel('PC 2','FontSize',16,'FontWeight','Bold')
ylabel('PC 3','FontSize',16,'FontWeight','Bold')
text(y(:,2),y(:,3),rows,'FontSize',14,'FontWeight','Bold')
xlim([min(y(:,2))-1,max(y(:,2))+1])
box on
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')

subplot(2,2,3)
plot(y(:,1),y(:,3),'wo')
title('first vs. third PC','FontSize',16,'FontWeight','Bold')
xlabel('PC 1','FontSize',16,'FontWeight','Bold')
ylabel('PC 3','FontSize',16,'FontWeight','Bold')
text(y(:,1)-1,y(:,3),rows,'FontSize',14,'FontWeight','Bold')
xlim([min(min(y(:,1)),min(y(:,3)))-1,max(max(y(:,1)),max(y(:,3)))+1])
box on
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')

 % display screeplot
subplot(2,2,4)
plot(1:8,e,'bo','LineWidth',1.6)
title('eigenvalues of S','FontSize',16,'FontWeight','Bold')
ylabel('\lambda','FontSize',16,'FontWeight','Bold')
box on
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')


% To save plots uncomment following lines
% print -painters -dpdf -r600 SMSpcacarm01.pdf
% print -painters -dpng -r600 SMSpcacarm01.png

r      = corr(y(:,1:2),x);  %correlation between first two components and data


figure(2)
% plot of correlation first two PCs with the original variables
plot(cos((0:360)/180*3.14159)',sin((0:360)/180*3.14159)','b:','LineWidth',1.6)
title('Car marks','FontSize',16,'FontWeight','Bold')
xlabel('first PC','FontSize',16,'FontWeight','Bold')
ylabel('second PC','FontSize',16,'FontWeight','Bold')
box on
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')
text(r(1,:),r(2,:),cols,'FontSize',16,'FontWeight','Bold')
xlim([-1.1,1.1])
ylim([-1.1,1.1])
line([-1.2 1.2],[0 0],'Color','k')
line([0 0],[1.2 -1.2],'Color','k')



% To save plots uncomment following lines
% print -painters -dpdf -r600 SMSpcacarm02.pdf
% print -painters -dpng -r600 SMSpcacarm02.png

% Hypothesis test of variance explained equal to 85% similar to Ex. 11.4

disp('test psi2=0.85')
disp('q=2')
beta   = (cumsum(e.^2)/sum(e.^2));
beta   = beta(2); 
disp('beta')
disp(beta)
psi    = (cumsum(e)/sum(e));
psi    = psi(2);
omega2 = (2*sum(e.^2)/((sum(e)).^2))*(psi.^2 - 2*beta*psi+beta);
disp('omega2')
disp(omega2)
disp('test statistic')
disp(sqrt(n-1)*(psi-0.85)/sqrt(omega2)) % test statistic has asymptotically
                                        % normal distribution.
                                        % With Phi^-1(0.975) = 1.96, the
                                        % proportion of variance explained
                                        % by the first two PCs is larger
                                        % than 85 %


