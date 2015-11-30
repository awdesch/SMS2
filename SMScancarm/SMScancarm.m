clear all
close all
clc

[type, economy, service, value, price, design, sporty, safety, handling] = textread('carmean2.dat','%s %f %f %f %f %f %f %f %f');
cars       = horzcat(economy, service, value, price, design, sporty, safety, handling); % Horizontal concatenation, creates data matrix
names      = strvcat('economy', 'service', 'value', 'price', 'design', 'sporty', 'safety', 'handling');
names      = cellstr(names);
names      = names([4, 1, 8]);  % reorder: price value econ serv design sport safe handling
x          = cars(:,[4, 1, 8]);
labels     = strvcat('audi','bmw','citroen','ferrari',...
            'fiat','ford','hyundai','jaguar',...
            'lada','mazda','mercedes','mitsubishi',...
            'nissan','opel corsa','opel vectra',...
            'peugeot','renault','rover','toyota',...
            'trabant','vw golf','vw passat','wartburg');
labels     = cellstr(labels);
s          = cov(x);             % covariance
s
sa         = s(1,1);         % covariance of price & value
sb         = s(2:3,2:3);         % covariance of rest
[va ea]    = eig(sa);            % spectral decomposition
ea         = diag(ea);
[ea, ind]  = sort(ea,'descend');
va         = va(:,ind);
[vb eb]    = eig(sb);% spectral decomposition
eb         = diag(eb);
[eb, ind]  = sort(eb,'descend');
vb         = vb(:,ind);
sa2        = va * diag(1./sqrt((ea))) * va';  % sa^(-1/2)
sb2        = vb * diag(1./sqrt((eb))) * vb';  % sb^(-1/2)
k          = sa2 * s(1,2:3) * sb2;           % matrix k
[g l d]    = svd(k,'econ');      % singular value decomposition
a          = sa2 * g;            % canonical vectors a
b          = sb2 * d;            % canonical vectors b
disp('first pair of canonical vectors')
disp(a(:,1))
disp(b(:,1))
eta        = x(:,1) * a(:,1);  % canonical variable eta 
phi        = x(:,2:3) * b(:,1);  % canonical variable phi 

plot(eta,phi, 'w')
title('subset of car marks','FontSize',16,'FontWeight','Bold')
xlabel('\eta','FontSize',16,'FontWeight','Bold')
ylabel('\phi','FontSize',16,'FontWeight','Bold')
text(eta,phi,labels,'FontSize',16,'FontWeight','Bold')
box on
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')
xlim([min(eta)-0.25,max(eta)+0.5])
ylim([min(phi-0.25),max(phi)+0.25])