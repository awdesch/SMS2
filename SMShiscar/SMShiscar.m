
clear all
close all
clc

% load data
load carc.txt

% define variables
% extract mileage by different headquarters from USA=1, Japan=2, EU=3 for
% calculation of means
M = carc(:,2);   % mileage
C = carc(:,13);  % headquarters

j=1;
l=1;
m=1;
for i=1:length(C)
    if (C(i)==1)
        us(j) = M(i);
        j = j+1;
    elseif (C(i)==2)
        ja(l) = M(i);
        l = l+1;
    elseif (C(i)==3)
        eu(m) = M(i);
        m = m+1;
    end
end

y = [10:2.5:45]'; % bandwidth = 2.5
origin = 10;
i = 0:15;
y1 = origin + 2.5*i + 2.5*(origin<min(us))-0.2;
y2 = origin + 2.5*i + 2.5*(origin<min(ja))-0.2;
y3 = origin + 2.5*i + 2.5*(origin<min(eu))-0.2;
y4 = origin + 2.5*i + 2.5*(origin<min(M))-0.2;
% plot
subplot(2,2,1)
hist(us,y1)
axis 'auto y'
axis manual
h = findobj(gca,'Type','patch');
set(h,'FaceColor','w','EdgeColor','k')
title('U.S. cars','FontSize',16,'FontWeight','Bold')
box on
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')
xlim([10 45])
subplot(2,2,2)
hist(ja,y2)
axis 'auto y'
axis manual
h = findobj(gca,'Type','patch');
set(h,'FaceColor','w','EdgeColor','k')
title('Japanese cars','FontSize',16,'FontWeight','Bold')
box on
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')
xlim([10 45])
subplot(2,2,3)
hist(eu,y3)
axis 'auto y'
axis manual
h = findobj(gca,'Type','patch');
set(h,'FaceColor','w','EdgeColor','k')
title('European cars','FontSize',16,'FontWeight','Bold')
box on
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')
xlim([10 45])
subplot(2,2,4)
hist(M,y4)
axis 'auto y'
axis manual
h = findobj(gca,'Type','patch');
set(h,'FaceColor','w','EdgeColor','k')
title('All cars','FontSize',16,'FontWeight','Bold')
box on
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')
xlim([10 45])