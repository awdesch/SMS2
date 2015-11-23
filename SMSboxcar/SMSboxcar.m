clear all     % clear variables
close all     % close windows
clc           % blank page

load carc.txt % load data

% extract mileage and company headquarters
M    = carc(:,2);     % mileage
C    = carc(:,13);    % headquarters


j    = 1;     % extract mileage by different headquarters from USA=1, Japan=2, EU=3 for
l    = 1; 
m    = 1;
for i=1:length(C)
    
    if (C(i)==1)
        us(j) = M(i); % Mileage US
        j     = j+1;
    elseif (C(i)==2)
        ja(l) = M(i); % Mileage Japan
        l     = l+1;
    elseif (C(i)==3)
        eu(m) = M(i); % Mileage Europe
        m     = m+1;
    end
end

% calculation of means for each headquarter
muus = mean(us);  % mean USA
muja = mean(ja);  % mean Japan
mueu = mean(eu);  % mean EU

% plot
hold on
line([0.775 1.225],[muus muus],'Color','k','LineStyle',':','LineWidth',1.2)
line([1.775 2.225],[muja muja],'Color','k','LineStyle',':','LineWidth',1.2)
line([2.775 3.225],[mueu mueu],'Color','k','LineStyle',':','LineWidth',1.2)
boxplot(M,C,'Symbol','o','labels',{'US','JAPAN','EU'})  
title('Car Data','FontSize',16,'FontWeight','Bold')
set(findobj(gca,'Type','text'),'FontSize',16,'FontWeight','Bold');
box on
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')   % set frame
hold off

% quantile
five = quantile(M,[.025 .25 .50 .75 .975]); 
five

% to save plot please uncomment following lines 
% print -painters -dpng -r600 SMSboxcar.png
% print -painters -dpdf -r600 SMSboxcar.pdf