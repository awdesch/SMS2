% clear history
clear all
close all
clc

% load data
load carc.txt

x     = [carc(:,1) carc(:,2) carc(:,8) carc(:,9)];

[n p] = size(x);

% bandwidth a la Scott's rule of thumb
for i = 1:p
   h(i) = 3.5.*sqrt(var(x(:,i)))*n.^(-1/3); % Scott's rule of thumb
end

pch   = carc(:,13)-1;

daspect([1,1,1])

figure(1)
 
for k = 0:15 
    i = fix(4k) + 1;  % div, ith raw
    j = rem(k,4) + 1;  % mod, jth column
subplot(4,4,(i-1)*4+j)


hold on
box on
axis off


  if (i>j) 
    for l=1:n
      if(pch(l)==0)
         
      plot(x(l,i),x(l,j),'ko','MarkerSize',4)
      elseif (pch(l)==1)
      plot(x(l,i),x(l,j),'r+','MarkerSize',4)
      elseif (pch(l)==2)
      plot(x(l,i),x(l,j),'b^','MarkerSize',4)
      set(gca,'YTickLabel',{})
      set(gca,'XTickLabel',{})
      end
    end
          
  end

   if (i<j) 



xrange = min(x(:,j)):(max(x(:,j))-min(x(:,j)))./size(x(:,j),1):max(x(:,j));
yrange = min(x(:,i)):(max(x(:,i))-min(x(:,i)))./size(x(:,i),1):max(x(:,i));

% steps
endx = length(xrange);
endy = length(yrange);
ndata = length(x(:,4));
% manual multivariate kernel density estimation
for xxxi=1:endx
    for yyyi=1:endy
        u1 =(xrange(xxxi)-x(:,j))/h(j);
        u2 =(yrange(yyyi)-x(:,i))/h(i);
        u=[u1,u2]';
        for is=1:ndata
            KD(is)=1/(2*pi)^(2/2)*exp(-1/2*u(:,is)'*u(:,is));
        end
        fhat(xxxi,yyyi)=mean(KD)/prod(h);
    end
end
contour(fhat,10,'LineWidth',1) 
     axis off

    end
end


figure(1)
subplot(4,4,1)
axis off
text(0.3,0.5,'price  ','FontSize',12,'FontWeight','Bold')
subplot(4,4,6)
axis off
text(0.3,0.5,'mileage','FontSize',12,'FontWeight','Bold')
subplot(4,4,11)
axis off
text(0.3,0.5,'weight ','FontSize',12,'FontWeight','Bold')
subplot(4,4,16)
axis off
text(0.3,0.5,'length ','FontSize',12,'FontWeight','Bold')
hold off