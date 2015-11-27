clear all
close all
clc


%% normalized principal components for geopol data set

load geopol.dat

pc = geopol(:,2:10);

[COEFF,SCORE,latent,tsquare] = princomp(zscore(pc));
COEFF(:,2) = -COEFF(:,2); % change signs according to book
SCORE(:,2) = -SCORE(:,2);


 rows = char('AFS', 'ALG', 'BRD', 'GBR', 'ARS', 'ARG', 'AUS', 'AUT', ...
     'BEL' ,'CAM', 'CAN' ,'CHL' ,'CHN',  'CUB', 'DAN' ,'EGY', 'ESP', ...
     'FRA' ,'GAB', 'GRE' ,'HOK' ,'HON', 'IND', 'IDO', 'ISR', 'ITA', ...
'JAP', 'KEN', 'MAR', 'MEX', 'NOR' ,'PER', 'POL', 'POR', 'SUE', 'SUI', ...
'THA', 'URS', 'USA', 'VEN', 'YOU');
 cols = char('popu', 'giph', 'ripo', 'rupo', 'rlpo', 'rspo', 'eltp', ...
     'rnnr', 'nunh', 'nuth');

OBSLABS = cellstr(rows);
VARLABS = cellstr(cols);

%% eigenvalues of the variance matrix are pcgeopol$sdev^2
figure(1)
subplot(2,2,1)
plot(SCORE(:,1),SCORE(:,2),'ow')
text(SCORE(:,1),SCORE(:,2),OBSLABS(:));
box on
title('first vs. second PC')
subplot(2,2,2)
plot(SCORE(:,3),SCORE(:,2),'ow')
title('third vs. second PC')
text(SCORE(:,3),SCORE(:,2),OBSLABS(:));
box on
subplot(2,2,3)
plot(SCORE(:,1),SCORE(:,3),'ow')
title('first vs. third PC')
text(SCORE(:,1),SCORE(:,3),OBSLABS(:))
box on
subplot(2,2,4)
bar(latent,'b')

% To save plots uncomment following lines
% print -painters -dpdf -r600 SMSnpcageopol01.pdf
% print -painters -dpng -r600 SMSnpcageopol01.png

figure(2)
subplot(2,2,1)
plot([-1.1,1.1]',[-1.1,1.1]','ow')
xlabel('first PC')
ylabel('second PC')
ucircle = [cos((0:360)/180*3.14159)',sin((0:360)/180*3.14159)'];
line(ucircle(:,1),ucircle(:,2),'LineStyle',':')
xlim([-1.2 1.2])
ylim([-1.2 1.2])
line([-1.2 1.2],[0 0],'Color','k')
line([0 0],[1.2 -1.2],'Color','k')
cors = COEFF*diag(sqrt(latent));
text(cors(:,1),cors(:,2),VARLABS(2:10))
box on

subplot(2,2,2)
plot([-1.1,1.1]',[-1.1,1.1]','ow')
xlabel('third PC')
ylabel('second PC')
line(ucircle(:,1),ucircle(:,2),'LineStyle',':')
xlim([-1.2 1.2])
ylim([-1.2 1.2])
line([-1.2 1.2],[0 0],'Color','k')
line([0 0],[1.2 -1.2],'Color','k')
text(cors(:,3),cors(:,2),VARLABS(2:10))
box on

subplot(2,2,3)
plot([-1.1,1.1]',[-1.1,1.1]','ow')
xlabel('first PC')
ylabel('third PC')
line(ucircle(:,1),ucircle(:,2),'LineStyle',':')
xlim([-1.2 1.2])
ylim([-1.2 1.2])
line([-1.2 1.2],[0 0],'Color','k')
line([0 0],[1.2 -1.2],'Color','k')
text(cors(:,1),cors(:,3),VARLABS(2:10))
box on

subplot(2,2,4)
col = cols(1:9,1:3);
for i=1:9
col(i,1:3) = sprintf('PC%d',i);
end
COLS = cellstr(col);
plot3([-1,1],[-1,1],[-1,1],'ow')
xlabel('PC1')
ylabel('PC2')
zlabel('PC3')
text(cors(:,1),cors(:,2),cors(:,3),COLS)
hold on
plot3(ucircle(:,1),ucircle(:,2),zeros(size(ucircle(:,1))),'LineStyle',':')
plot3(zeros(size(ucircle(:,1))),ucircle(:,1),ucircle(:,2),'LineStyle',':')
plot3(ucircle(:,1),zeros(size(ucircle(:,1))),ucircle(:,2),'LineStyle',':')

% To save plots uncomment following lines
% print -painters -dpdf -r600 SMSnpcageopol02.pdf
% print -painters -dpng -r600 SMSnpcageopol02.png

