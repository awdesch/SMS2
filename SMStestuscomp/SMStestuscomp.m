% clear variables and close windows
clear all
close all
clc

% load data
load('uscomp.txt')

x1 = uscomp(find(uscomp(:,7)==2),1:6);
x2 = uscomp(find(uscomp(:,7)==5),1:6);

ht = hotellingstat(x1,x2);

disp('hotelling test results')
disp('test statistic')
disp(ht.t2)
disp('degrees of freedom')
disp(ht.df)
disp('p-value')
disp(ht.pval)

n1 = 15;
n2 = 10;
n  = n1+n2;
p  = 6;

x1m = mean(x1);
x2m = mean(x2);

s   = ((n1-1)*cov(x1)+(n2-1)*cov(x2))/n;
sjj = diag(s);

t   = sqrt(p*n.^2/(n1*n2*(n-p-1))*finv(0.95,p,n-p-1)*sjj);

disp('confidence interval for each variable')
disp([round(x1m-x2m-t')',round(x1m-x2m+t')'])
