clear all
close all
clc

x         = load('vocabulary.dat');
voc       = x(:,1:4); 
[lambda,psi,T,stats,F] = factoran(voc, 1, 'scores', 'Bartlett')
facttable = [lambda, (1 - psi), psi];
format bank
disp('          q1            Communalities Specific variances')
disp(facttable)
format short
lab = strvcat(num2str((1:64)'));
plot((1:64)',F,'w')
text((1:64)',F(:),lab,'FontSize',14)
ylabel('Score','FontSize',16,'FontWeight','Bold')
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')