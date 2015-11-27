
clear all
close all
clc

% load data
x        = load('bank2.dat');
[m,n]    = size(x);
xmeanm   = repmat((mean(x))',1,m);
stdvec   = sqrt((m-1)/m)*repmat(std(x)',1,m);

% transformation
x        = (x'-xmeanm)./stdvec;
x        = x'/sqrt(m);

% singular value decomposition
[U,S,V]  = svd(x);

% coordinates
w        = V(:,1:3)*S(1:3,1:3);
z        = U(:,1:3)*S(1:3,1:3);

% labels
a        = strvcat('Length','Height Left','Height Right','Inner Frame Lower','Inner Frame Upper','Diagonal');
lab      = cellstr(a);
b        = strvcat([repmat('G',100,1);repmat('F',100,1)]);
label    = cellstr(b);

%plot variables
figure(1)
subplot(2,2,1);
plot(w(:,1),w(:,2),'d', 'Color', 'white')
axis([-1.01 1.01  -1.01 1.01]);
xlabel('W_1','FontSize',16,'FontWeight','bold')
ylabel('W_2','FontSize',16,'FontWeight','bold')
title('Swiss bank variables','FontSize',16,'FontWeight','Bold')
for i=1:n
text(w(i,1)-0.2,w(i,2),lab(i),'FontSize',18, 'Color', 'blue')
end
set(gca,'FontSize',16,'LineWidth',2,'FontWeight','bold')

subplot(2,2,3);
plot(w(:,1),w(:,3),'d', 'Color', 'white')
axis([-1.01 1.01  -1.01 1.01]);
xlabel('W_1','FontSize',16,'FontWeight','bold')
ylabel('W_3','FontSize',16,'FontWeight','bold')
title('Swiss bank variables','FontSize',16,'FontWeight','Bold')
for i=1:n
text(w(i,1)-0.2,w(i,3),lab(i),'FontSize',18, 'Color', 'blue')
end
set(gca,'FontSize',16,'LineWidth',2,'FontWeight','bold')

subplot(2,2,4);
plot(w(:,2),w(:,3),'d', 'Color', 'white')
axis([-1.01 1.01  -1.01 1.01]);
xlabel('W_2','FontSize',16,'FontWeight','bold')
ylabel('W_3','FontSize',16,'FontWeight','bold')
title('Swiss bank variables','FontSize',16,'FontWeight','Bold')
for i=1:n
text(w(i,2)-0.2,w(i,3),lab(i),'FontSize',18, 'Color', 'blue')
end
set(gca,'FontSize',16,'LineWidth',2,'FontWeight','bold')

%plot bank notes
figure(2)
subplot(2,2,1);
plot(z(:,1),z(:,2),'d', 'Color', 'white')
axis([-0.25 0.25  -0.25 0.25]);
xlabel('Z_1','FontSize',16,'FontWeight','bold')
ylabel('Z_2','FontSize',16,'FontWeight','bold')
title('Swiss bank notes','FontSize',16,'FontWeight','Bold')
for i=1:m
text(z(i,1),z(i,2),label(i),'FontSize',18, 'Color', 'blue')
end
set(gca,'FontSize',16,'LineWidth',2,'FontWeight','bold')

subplot(2,2,3);
plot(z(:,1),z(:,3),'d', 'Color', 'white')
axis([-0.25 0.25  -0.25 0.25]);
xlabel('Z_1','FontSize',16,'FontWeight','bold')
ylabel('Z_3','FontSize',16,'FontWeight','bold')
title('Swiss bank notes','FontSize',16,'FontWeight','Bold')
for i=1:m
text(z(i,1),z(i,3),label(i),'FontSize',18, 'Color', 'blue')
end
set(gca,'FontSize',16,'LineWidth',2,'FontWeight','bold')

subplot(2,2,4);
plot(z(:,2),z(:,3),'d', 'Color', 'white')
axis([-0.25 0.25  -0.25 0.25]);
xlabel('Z_2','FontSize',16,'FontWeight','bold')
ylabel('Z_3','FontSize',16,'FontWeight','bold')
title('Swiss bank notes','FontSize',16,'FontWeight','Bold')
for i=1:m
text(z(i,2),z(i,3),label(i),'FontSize',18, 'Color', 'blue')
end
set(gca,'FontSize',16,'LineWidth',2,'FontWeight','bold')

% 3d scatter
figure(3)
plot3(z(:,1),z(:,2),z(:,3),'wo')
for i=1:100
text(z(i,1),z(i,2),z(i,3),label(i),'FontSize',18, 'Color', 'black')
end
for i=101:200
text(z(i,1),z(i,2),z(i,3),label(i),'FontSize',18, 'Color', 'red')
end
xlabel('Z_1','FontSize',16,'FontWeight','bold')
ylabel('Z_2','FontSize',16,'FontWeight','bold')
zlabel('Z_3','FontSize',16,'FontWeight','bold')
set(gca,'FontSize',16,'LineWidth',2,'FontWeight','bold')
