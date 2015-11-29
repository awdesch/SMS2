clear all
close all
clc


load('athletic.mat')

% main calculation
[lambda,psi,T,stats,F] = factoran(athletic.data,3,'rotate','varimax','scores','regression')

facttable = [lambda, (1 - psi), psi];
format bank
disp('          q1            q2            q3            Communalities  Specific variances')
disp(facttable)

format short
lab = athletic.textdata(1,2:end);
ucircle      = [cos((0:360)/180*3.14159)' , sin((0:360)/180*3.14159)'];

%% correlation plots of factor loadings with variables
figure(1)
subplot(2,2,1)
plot(ucircle(:,1),ucircle(:,2),'b:')
title('Athletic (varimax)','FontSize',16,'FontWeight','Bold')
ylim([-1.01,1.01])
xlim([-1.01,1.01])
xlabel('q_1','FontSize',16,'FontWeight','Bold')
ylabel('q_2','FontSize',16,'FontWeight','Bold')
line([0,0]',[-1.5,1.5]')
line([-1.5,1.5]',[0,0]')
text(lambda(:,1)-0.2,lambda(:,2),lab','FontSize',14)
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')

subplot(2,2,3)
plot(ucircle(:,1),ucircle(:,2),'b:')
title('Athletic (varimax)','FontSize',16,'FontWeight','Bold')
ylim([-1.01,1.01])
xlim([-1.01,1.01])
xlabel('q_1','FontSize',16,'FontWeight','Bold')
ylabel('q_3','FontSize',16,'FontWeight','Bold')
line([0,0]',[-1.5,1.5]')
line([-1.5,1.5]',[0,0]')
text(lambda(:,1)-0.2,lambda(:,3),lab','FontSize',14)
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')

subplot(2,2,4)
plot(ucircle(:,1),ucircle(:,2),'b:')
title('Athletic (varimax)','FontSize',16,'FontWeight','Bold')
ylim([-1.01,1.01])
xlim([-1.01,1.01])
xlabel('q_2','FontSize',16,'FontWeight','Bold')
ylabel('q_3','FontSize',16,'FontWeight','Bold')
line([0,0]',[-1.5,1.5]')
line([-1.5,1.5]',[0,0]')
text(lambda(:,2)-0.2,lambda(:,3),lab','FontSize',14)
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')

%% plots of factor scores
names = athletic.textdata(2:end,1);
figure(2)
subplot(2,2,1)
plot(F(:,1),F(:,2),'w')
xlabel('f_1','FontSize',16,'FontWeight','Bold')
ylabel('f_2','FontSize',16,'FontWeight','Bold')
title('Athletic (factor scores)','FontSize',16,'FontWeight','Bold')
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')
text(F(:,1),F(:,2),names)
subplot(2,2,3)
plot(F(:,1),F(:,3),'w')
xlabel('f_1','FontSize',16,'FontWeight','Bold')
ylabel('f_3','FontSize',16,'FontWeight','Bold')
title('Athletic (factor scores)','FontSize',16,'FontWeight','Bold')
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')
text(F(:,1),F(:,3),names)
subplot(2,2,4)
plot(F(:,2),F(:,3),'w')
xlabel('f_2','FontSize',16,'FontWeight','Bold')
ylabel('f_3','FontSize',16,'FontWeight','Bold')
title('Athletic (factor scores)','FontSize',16,'FontWeight','Bold')
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')
text(F(:,2),F(:,3),names)

FL = [(1:length(F(:,1)))',F];
[B1,index1] = sortrows(FL,2);
[B2,index2] = sortrows(FL,3);
[B3,index3] = sortrows(FL,4); 
names(index1)
names(index2)
names(index3)