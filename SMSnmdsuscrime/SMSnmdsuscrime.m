clear all
close all
clc

x     = load('uscrime.dat');
text1 = cellstr(strvcat('ME','NH','VT','MA','RI','CT','NY','NJ','PA','OH','IN','IL','MI','WI','MN','IA','MO','ND','SD','NE','KS','DE','MD','VA','WV','NC','SC','GA','FL','KY','TN','AL','MS','AR','LA','OK','TX','MT','ID','WY','CO','NM','AZ','UT','NV','WA','OR','CA','AK','HI'));
[n p] = size(x);
x     = zscore(x);

% distance matrix
Dist  = pdist(x,'euclidean');
[Y,stress,disparities] = mdscale(Dist,2,'criterion','stress');

Markers= ['s','s','s','s','s','s','s','s','s',...
 'o','o','o','o','o','o','o','o','o','o','o','o',...
 '^','^','^','^','^','^','^','^','^','^','^','^','^','^','^','^',...
 'x','x','x','x','x','x','x','x','x','x','x','x','x'];


plot(Y(:,1),Y(:,2),'wo')
for i=1:n
plot(Y(i,1),Y(i,2),Markers(i),'Color','k','MarkerSize',10,'LineWidth',2)
hold on
end
ylabel('x_2','FontSize',16,'FontWeight','Bold')
xlabel('x_1','FontSize',16,'FontWeight','Bold')
ylim([min(Y(:,2))-0.25,max(Y(:,2))+0.25])
xlim([min(Y(:,1))-0.25,max(Y(:,1))+0.25])
title('US crime','FontSize',16,'FontWeight','Bold')
text(Y(:,1)+0.25,Y(:,2)-0.25,text1,'FontSize',16,'FontWeight','Bold')
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')
axis square