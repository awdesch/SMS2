
clear all
close all
clc

% load data
fooddata = importdata('food.csv');
x        = fooddata.data;
[m,n]    = size(x);
textz    = fooddata.textdata(2:(m+1),1);
textw    = transpose(fooddata.textdata(1,2:(n+1)));
xmeanm   = repmat((mean(x))',1,m);
stdvec   = sqrt((m-1)/m)*repmat(std(x)',1,m);

% transformation
x        = (x'-xmeanm)./stdvec;
x        = x'/sqrt(m);

% singular value decomposition
[U,S,V]  = svd(x);

w        = V(:,1:2)*S(1:2,1:2)*(-1);
z        = U(:,1:2)*S(1:2,1:2)*(-1);

%plot
subplot(1,2,1);
plot(w(:,1),w(:,2),'d', 'Color', 'white')
axis([-1 1  -1 1]);
xlabel('W[,1]','FontSize',16,'FontWeight','bold')
ylabel('W[,2]','FontSize',16,'FontWeight','bold')
title('Food','FontSize',16,'FontWeight','Bold')
for i=1:n
text(w(i,1),w(i,2),textw(i),'FontSize',18, 'Color', 'blue')
end
set(gca,'FontSize',16,'LineWidth',2,'FontWeight','bold')

subplot(1,2,2);
plot(z(:,1),z(:,2),'d', 'Color', 'white')
axis([-2 1.5 -1 1]);
xlabel('Z[,1]','FontWeight','bold','FontSize',16)
ylabel('Z[,2]','FontWeight','bold','FontSize',16)
title('Families','FontSize',16,'FontWeight','Bold')
for i=1:m
text(z(i,1),z(i,2),textz(i),'FontSize',18, 'Color', 'red')
end
set(gca,'FontSize',16,'LineWidth',2,'FontWeight','bold')

  % print -painters -dpdf -r600 SMSdecofood.pdf
  % print -painters -dpng -r600 SMSecofood.png