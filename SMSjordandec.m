% ----------------------------------------------------------------------------
%  Book:        Multivariate Statistics: Exercises and Solutions Series 
% ----------------------------------------------------------------------------
%  Quantlet:    SMSjordandec
% ----------------------------------------------------------------------------
%  Description: SMSjordandec performs a Jordan decomposition of a symmetric 
%               (3 x 3) matrix using its eigenvalues and eigenvectors.
% ----------------------------------------------------------------------------
%  Usage:       -
% ----------------------------------------------------------------------------
%  Keywords:    spectral decomposition, eigenvalues, eigenvectors,
%               decomposition, eigenvalue decomposition
% ----------------------------------------------------------------------------
%  See also:    SMSellipse, SMSjordandec
% ----------------------------------------------------------------------------
%  Author:      R: Dana Chromikova
%               Matlab: Awdesch Melzer 20121126
% ----------------------------------------------------------------------------


% clear variables and close windows
clear all
close all
clc

% main calculation
A         = [[1;2;3],[2;1;2],[3;2;1]];     % matrix A
[vec val] = eigs(A);                       % eigenvalues and eigenvectors of A
gama      = vec                            % matrix of eigenvectors

lambda    = val                            % diagonal matrix containing the eigenvalues

gama*lambda*gama'                          % Jordan decomposition
