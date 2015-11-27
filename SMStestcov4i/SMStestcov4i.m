% clear variables and close windows
clear all
close all
clc

%% part A

s1     = [  21.907, 1.415, -2.050,  2.379;
            1.415, 11.853,  2.104, -1.864;
           -2.050,  2.104, 17.230,  0.905;
            2.379, -1.864,  0.905,  9.037];

s0     = [ 4, 0, 0, 0;
           0, 4, 0, 0;
           0, 0, 4, 0;
           0, 0, 0, 4];

s01    = diag(1./diag(s0)); % only because it is diagonal
n      = 30;                % population size
tst    = n*sum(diag(s01*s1))-n*log(det(s01*s1))-n*4; % test statistic
crtval = chi2inv(0.95,10);  % crititcal value

disp('Part A')
disp(tst)
disp(crtval)

%% part B

s1      = [14.649, -0.024, 1.248, -3.961;
           -0.024, 15.825, 0.746,  4.301;
            1.248,  0.746, 9.446,  1.241;
           -3.961,  4.301, 1.241, 20.002];

tst     = n*sum(diag(s01*s1))-n*log(det(s01*s1))-n*4; % test statistic
crtval  = chi2inv(0.95,10); % crititcal value

disp('Part B')
disp(tst)
disp(crtval)

