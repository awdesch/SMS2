% clear memory and close windows
clear all
close all
clc

% SMSchi2bac
% test of independence for french baccalaureat data
[type, A, B, C, D, E, F, G, H] = textread('bac.dat','%s %f %f %f %f %f %f %f %f');
bac                            = [A, B, C, D, E, F, G, H];
[hNull pValue X2]              = chi2test(bac,0.05)