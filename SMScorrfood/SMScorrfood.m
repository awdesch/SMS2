% clear memory and close windows
clear all
close all
clc

%% load data
[type, A, B, C, D, E, F, G] = textread('food.dat','%s %f %f %f %f %f %f %f');
x       = [A, B, C, D, E, F, G];

a       = sum(x,2);a	% row frequencies		
b       = sum(x,1);b	% column frequencies

% estimated expected value in (i,j)-th category
% under the assumption of independence
e       = a*b/sum(a);
round(e)

% chi-matrix (contributors to the chi-statistics), 
% which may be viewed as a measure of the departure 
% of the observed x_{ij} from independence
C       = (x-e)./sqrt(e);

[u d v] = svd(C,'econ')			% singular value decomposition

C       = u*d*v'		% this should be matrix C
% eigenvalues & percentages
[power(diag(d),2), cumsum(power(diag(d),2)/sum(power(diag(d),2)))]


  r1    = repmat(diag(d)',size(u,1),1).*u; %multiplies each column of g with each corresponding element of l
  r     = (r1./repmat(sqrt(a),1,size(u,2))) %divides each row of r1 with each corresponding element of sqrt(a)

  s1    = repmat(diag(d)',size(v,1),1).*v; %multiplies each column of d with each corresponding element of l
  s     = (s1./repmat(sqrt(b)',1,size(v,2)))%divides each row of s1 with each corresponding element of sqrt(b)

  car   = repmat(a,1,size(r,2)).*r.^2./repmat(diag(d)'.^2,size(r,1),1) %contribution in r

  cas   = repmat(b',1,size(s,2)).*s.^2./repmat(diag(d)'.^2,size(s,1),1) %contribution in s

rr      = r(:,1:2);
rr(:,2) = rr(:,2)*(-1)
ss      = s(:,1:2);
ss(:,2) = ss(:,2)*(-1)

xrows = type;
xcols = strvcat('bread', 'vegetables', 'fruits', 'meat', 'poultry', 'milk', 'wine');
xcols = cellstr(xcols);

%% plot
plot(r(:,1),rr(:,2),'wo')
xlabel('r_1,s_1','FontSize',16,'FontWeight','Bold')
ylabel('r_2,s_2','FontSize',16,'FontWeight','Bold')
title('French food','FontSize',16,'FontWeight','Bold')
ylim([min([min(rr(:,2)),min(ss(:,2))])-0.05,max([max(rr(:,2)),max(ss(:,2))])+0.05])
xlim([min([min(rr(:,1)),min(ss(:,1))]),max([max(rr(:,1)),max(ss(:,1))])])
text(ss(:,1),ss(:,2),xcols,'color','r','FontSize',16,'FontWeight','Bold')
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold')
text(rr(:,1),rr(:,2),xrows,'color','b','FontSize',16,'FontWeight','Bold')
line([0,0]',[-1.5,1.5]','color','k','LineWidth',1.6)
line([-1.5,1.5]',[0,0]','color','k','LineWidth',1.6)


