clear all
close all
clc

%% load data and take sample
load('bank2.dat')

% set pseudo random numbers
RandStream.setGlobalStream(RandStream('mt19937ar','seed',9));

% sample n=20 out of the data set
bank2      = [(1:200)',bank2];    % set index variable
n          = 20;                  % sample size
keep       = datasample(bank2,n); % 20 randomly selected Swiss bank notes

label      = [];
for k = 1:200
    if k<=100
        label = [label; 'Genuine  '];
    else
        label = [label; 'Forged   '];
    end
end

% uncomment for 20 banknotes as in the book
 % keep  = [7,8,16,39,71,73,89,94,94,100,110,121,129,131,149,150,154,161,163,174]';

%% compute Fisher's LDA with training sample
test_ind   = keep(:,1);
truth      = [ones(100,1);zeros(100,1)];
group      = truth(keep(:,1));

% LDA classifier
mdl        = ClassificationDiscriminant.fit(bank2(test_ind,2:end),label(test_ind,:));
% LDA model prediction
pred       = predict(mdl,bank2(:,2:end));
% truth-prediction 
[C,order]  = confusionmat(label,pred);

%% create table of true vs predicted observations
cols       = cellstr(strvcat('         ','         ','Prediction','         '));
rows       = cellstr(strvcat('         ','Truth     ','         '));
rows1      = cellstr(strvcat('         ',order));
cols1      = cellstr(strvcat(order(1,:), num2str(C(:,1))));
cols2      = cellstr(strvcat(order(2,:), num2str(C(:,2))));
table      = [rows, rows1, cols1, cols2];
table      = [cols'; table];
disp(table)