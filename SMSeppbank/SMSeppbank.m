% clear variables and close windows
clear all;
close all;
clc;

RandStream.setDefaultStream(RandStream('mt19937ar','seed',100));

% load data
x = load('bank2.dat');

% sphere the data
x = sphere(x);

% choose bandwidth according to Silverman s rule of thumb
h = 1.06*length(x)^(-1/5).*max(std(x));

% choose number of projections
n = 10000;

[xa xi fa fi tit pind cind] = ppexample(x, h, n);

    plot(fi(:,1),fi(:,2),'r-','LineWidth',2)
    hold on;
    plot(xa(1:100,1),xa(1:100,2),'bo')
    ylim([-0.2,0.5]);
    xlim([-4,4]);
    plot(xa(101:200,1),xa(101:200,2),'b^')
    plot(xi(1:100,1),xi(1:100,2),'ro')
    plot(xi(101:200,1),xi(101:200,2),'r^')
    ylabel('Y','FontWeight','bold','FontSize',16);
    xlabel('X','FontWeight','bold','FontSize',16);
    line(fa(:,1),fa(:,2),'color','b','LineWidth',2)
    set(gca,'FontSize',16,'LineWidth',2,'FontWeight','bold');
    hold off;
    title(tit,'FontWeight','bold','FontSize',16);