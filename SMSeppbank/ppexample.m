function [xa xi fa fi tit pind cind] = ppexample(x, h, n)
  xg     = linspace(-4,4,81);
  id     = [3*ones(100,1);4*ones(100,1)];

% select a starting vector
  p      = normrnd(0,1,size(x,2),1);
  p      = p./sqrt(sum(p.^2));
% compute index for starting vector
  xp     = x*p;
  imin   = ppf(xp,h);
  imax   = imin;

  xi     = [xp,unifrnd(0,1,length(xp),1)];
  xi(:,2)= -0.11-0.08*xi(:,2);
  [fi(:,2) fi(:,1)] = ksdensity(xp,xg','width',h,'kernel','epanechnikov');
  xa     = [xp,unifrnd(0,1,length(xp),1)];
  xa(:,2)= -0.01-0.08*xa(:,2);
  [fa(:,2) fa(:,1)] = ksdensity(xp,xg','width',h,'kernel','epanechnikov');
    figure(1)
    plot(fi(:,1),fi(:,2),'r-','LineWidth',2)
    hold on;
    plot(xa(1:100,1),xa(1:100,2),'bo')
    ylim([-0.2,0.5]);
    xlim([-4,4]);
    plot(xa(101:200,1),xa(101:200,2),'b^')
    plot(xi(1:100,1),xi(1:100,2),'ro')
    plot(xi(101:200,1),xi(101:200,2),'r^')
    ylabel('Y');
    xlabel('X');
    line(fa(:,1),fa(:,2),'color','b','LineWidth',2)
    hold off;
  inds   = [1/sqrt(4*pi),imax]';
  pind   = [(1:length(inds))',inds];

%  search for better projection vector
  i    = 0;
  pmin = 1;
  pmax = 1;
  while (i<n)
    i    = i+1;
    A1   = num2str(i,'%10.0f');
    tit  = strcat(A1,{' '},{'directions'});
    p    = normrnd(0,1,size(x,2),1);
    p    = p./sqrt(sum(p.^2));
    xp   = x*p;
    ind  = ppf(xp, h);
    inds = [inds',ind]';
    pind = [(1:length(inds))',inds];
    cind = [2,1]';
    cind(find(inds==max(inds))) = 4;
    cind(find(inds==min(inds))) = 1;
    cind(1) = 2;

    if (ind>imax)
      imax = ind;
      xa     = [xp,unifrnd(0,1,length(xp),1)];
      xa(:,2)= -0.01-0.08*xa(:,2);
      [fa(:,2) fa(:,1)] = ksdensity(xp,xg','width',h,'kernel','epanechnikov');% line red dashed
    figure(1)
    plot(fi(:,1),fi(:,2),'r-','LineWidth',2)
    hold on;
    plot(xa(1:100,1),xa(1:100,2),'bo')
    ylim([-0.2,0.5]);
    xlim([-4,4]);
    plot(xa(101:200,1),xa(101:200,2),'b^')
    plot(xi(1:100,1),xi(1:100,2),'ro')
    plot(xi(101:200,1),xi(101:200,2),'r^')
    ylabel('Y');
    xlabel('X');
    line(fa(:,1),fa(:,2),'color','b','LineWidth',2)
    title(tit)
    hold off;
      pmin = i;
    end
    if (ind<imin)
      imin   = ind;
      xi     = [xp,unifrnd(0,1,length(xp),1)];
      xi(:,2)= -0.11-0.08*xi(:,2);
      [fi(:,2) fi(:,1)] = ksdensity(xp,xg','width',h,'kernel','epanechnikov'); % blue line
    figure(1)
    plot(fi(:,1),fi(:,2),'r-','LineWidth',2)
    hold on;
    plot(xa(1:100,1),xa(1:100,2),'bo')
    ylim([-0.2,0.5]);
    xlim([-4,4]);
    plot(xa(101:200,1),xa(101:200,2),'b^')
    plot(xi(1:100,1),xi(1:100,2),'ro')
    plot(xi(101:200,1),xi(101:200,2),'r^')
    ylabel('Y');
    xlabel('X');
    line(fa(:,1),fa(:,2),'color','b','LineWidth',2)
    title(tit)
    hold off;
      pmax = i;
      mini = p;
    end
    A1   = num2str(i,'%10.0f');
    tit  = strcat(A1,{' '},{'directions'});
  end
  
    end
