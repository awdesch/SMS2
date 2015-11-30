% clear variables and close windows
clear all
close all
clc

y1  = [1,2,4,3,6,5]';
y2  = [1,3,4,2,5,6]';
y3  = [3,1,5,2,6,4]';
y   = [y1;y2;y3];

x1  = [ones(6,1),[0;0;1;1;0;0],[0;0;0;0;1;1],[0;1;0;1;0;1]];
x   = [x1;x1;x1];

disp('     SUMMARY lm(y~x-1)n     ')
lmd = LinearModel.fit(x,y,'Intercept',false)

z1  = [y1(1:2)',y2(1:2)',y3(1:2)'];
z2  = [y1(3:4)',y2(3:4)',y3(3:4)'];
z3  = [y1(5:6)',y2(5:6)',y3(5:6)'];
z   = [z1,z2,z3];

lmz = LinearModel.fit([z1',z2'],z3)
disp('      ANOVA lm(z3~z1+z2)    ')
anova(lmz)