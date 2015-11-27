close all
clear all
clc

load 'plasma.dat';

plasma(:,1) = [1*ones(1,5),2*ones(1,5)]';

plot(mean(plasma(1:5,2:4)),'-b','LineWidth',2)
hold on
plot(mean(plasma(6:10,2:4)),'-r','LineWidth',2)
profiles = [mean(plasma(1:5,2:4))',mean(plasma(6:10,2:4))'];
text(2.2,145,'Group 1','Color','blue','FontSize',14)
text(2.2,114,'Group 2','Color','red','FontSize',14)
ylim([min(min(mean(plasma(1:5,2:4)),mean(plasma(6:10,2:4)))),max(max(mean(plasma(1:5,2:4)),mean(plasma(6:10,2:4))))+3])
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')
box on
hold off


% To save the plots as pdf and png, please, uncomment the following lines
% print -painters -dpng -r600 SMSprofplasma.png
% print -painters -dpdf -r600 SMSprofplasma.pdf


covpool   = (4/5)*(cov(plasma(1:5,2:4))+cov(plasma(6:10,2:4)))/2;
diff      = profiles(:,1)-profiles(:,2);
c         = [diag(ones(2,1)),zeros(2,1)]-[zeros(2,1),diag(ones(2,1))];

n1        = 5;       # size population 1
n2        = 5;       # size population 2
p         = 3;       # number of variables to estimate
n         = n1 + n2; # pooled population size

% are the profiles parallel?

test1 = ((n1*n2*(n1+n2-p))/((n.^2)*(p-1)))*(c*diff)'*inv(c*covpool*c')*c*diff
theo_val1 = finv(0.95,2,7)

% test the equality of parallel profiles

one       = ones(3,1);
test2     = ((n1*n2*(n1+n2-2))/((n.^2)))*((one)'*diff).^2./((one)'*covpool*one)

theo_val2 = finv(0.95,1,8)

% test horizontality of parallel profiles

meanprf   = mean(profiles,2);
test3=((n1+n2-p)/(p-1))*(c*meanprf)'*inv(c*covpool*(c)')*c*meanprf

theo_val3 = finv(0.95,2,7)
