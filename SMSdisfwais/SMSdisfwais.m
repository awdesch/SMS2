clear all
close all
clc

%% Fisher's LDA for WAIS data

load('wais.dat')

mdl        = ClassificationDiscriminant.fit(wais(:,3:end),wais(:,1),'Prior','uniform');
% LDA model prediction
pred       = predict(mdl,wais(:,3:end));
% truth-prediction 
label      = wais(:,1);
[C,order]  = confusionmat(label,pred);

cols       = cellstr(strvcat('         ','         ','Prediction','         '));
rows       = cellstr(strvcat('         ','Truth     ','         '));
rows1      = cellstr(strvcat('         ',order));
cols1      = cellstr(strvcat(order(1,:), num2str(C(:,1))));
cols2      = cellstr(strvcat(order(2,:), num2str(C(:,2))));
table      = [rows, rows1, cols1, cols2];
table      = [cols'; table];
disp(table)

%% compute apparent error rate (APER)
aper       = (sum(sum(C))-sum(diag(C)))/sum(sum(C));
disp(aper)

%% compute actual error rate (AER)
correct=0;
for i = 1:size(wais,1)
    subset      = wais;
    subset(i,:) = [];
    mdl         = ClassificationDiscriminant.fit(subset(:,3:end),subset(:,1),'Prior','uniform');
    pred        = predict(mdl,wais(i,3:end));
    if (pred==wais(i,1))
        correct=correct+1;
    end
end


aer  = 1-correct/size(wais,1);
disp(aer)
