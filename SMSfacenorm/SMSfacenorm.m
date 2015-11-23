% remove variables and close windows
clear all
close all
clc

x = normrnd(0,1,50,1);       % generates 50 standard normal distributed data
y = normrnd(2,1,50,1);       % generates 50 normal distributed data with mean 2
z = [x y];
% change the following value to adjust other parts of the faces. Choose an integer between 1 and 17.
f = [1];                     % size of face 

% plot
figure(1)
glyphplot(x, 'Glyph','face','Features',f,'Grid',[5 10],'Page','all')
title('Random Flury Faces');
figure(2)
glyphplot(y, 'Glyph','face','Features',f,'Grid',[5 10],'Page','all')
title('Random Flury Faces');