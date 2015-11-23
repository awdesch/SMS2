 % clear history
clear all
close all
clc

 % load data
load unemploy.dat

 % preparing data
all = unemploy;
we = [3 3 2 3 3 3 3 3 3 3 3 2 2 2 2 2]'; % 3=West, 2=East

j=1;
l=1;
for i=1:length(we)
    if (we(i)==3)
        w(j) = all(i); % west
        j = j+1;
    elseif (we(i)==2)
        e(l) = all(i); % east
        l = l+1;
    end
end

 % calculating means
means = [mean(all), mean(e), mean(w)];


 % resampling for plot
data = [all;all];
groups = [ones(length(all),1);we];

hold on
 % adding means into plot
line([0.775 1.225],[means(1) means(1)],'Color','k','LineStyle',':','LineWidth',1.2)
line([1.775 2.225],[means(2) means(2)],'Color','k','LineStyle',':','LineWidth',1.2)
line([2.775 3.225],[means(3) means(3)],'Color','k','LineStyle',':','LineWidth',1.2)
 % producing boxplots
boxplot(data,groups,'Symbol','o', 'labels',{'All', 'East', 'West'});
title('Unemployment in Germany','FontSize',16,'FontWeight','Bold');
set(findobj(gca,'Type','text'),'FontSize',16,'FontWeight','Bold');
box on
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')   % set frame
hold off


 % to save plot please uncomment following lines 
 % print -painters -dpng -r600 SMSboxunemp.png
 % print -painters -dpdf -r600 SMSboxunemp.pdf