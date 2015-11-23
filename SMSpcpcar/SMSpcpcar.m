clear all
close all
clc

% load data
load carc.txt

x = carc;

[n1 n2] = size(x); % data size

range = max(x) - min(x) + (max(x)==min(x)); % data range

range_mat = ones(n1,1)*range;
min_mat = ones(n1,1)*min(x);

t=(x-min_mat)./(range_mat); %standardize data

C = x(:,13);

% extract observations for USA, Japan, Europe
k=0;
l=0;
m=0;
for i=1:length(x)
   if x(i,13)==1
       k=k+1;
       us(k,:)=t(i,:);
   
   elseif x(i,13)==2
           l=l+1;
           ja(l,:)=t(i,:);
     
       elseif x(i,13)==3
               m=m+1;
               eu(m,:)=t(i,:);
   end
end

% plot
hold on
box on
p1 = plot(us','linewidth',1.6,'Color','k','LineStyle','-');
p2 = plot(ja','linewidth',1.6,'Color','r','LineStyle',':');
p3 = plot(eu','linewidth',1.6,'Color','b','LineStyle','--'); 
title('Parallel Coordinate Plot (Car Data)','FontSize',16,'FontWeight','Bold')

P1 = hggroup;
P2 = hggroup;
P3 = hggroup;

set(p1,'Parent',P1)
set(p2,'Parent',P2)
set(p3,'Parent',P3)

set(get(get(P1,'Annotation'),'LegendInformation'),...
   'IconDisplayStyle','on'); % Include this hggroup in the legend
set(get(get(P2,'Annotation'),'LegendInformation'),...
   'IconDisplayStyle','on'); % Include this hggroup in the legend
set(get(get(P3,'Annotation'),'LegendInformation'),...
   'IconDisplayStyle','on'); % Include this hggroup in the legend

legend('us','japan','europe','Location','SouthOutside','Orientation','horizontal')
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')
hold off

% to save plot please uncomment following lines 
% print -painters -dpng -r600 SMSpcpcar.png
% print -painters -dpdf -r600 SMSpcpcar.pdf
