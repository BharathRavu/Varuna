% plot lid velocity

y=-1:0.001:1;
nn=length(y);
yy=zeros(nn,1);
yy2=zeros(nn,1);
for i=1:nn
%yy(i)=y(i)*y(i)*(1-exp(-10000*(1-y(i)*y(i))*(1-y(i)*y(i))*(1-y(i)*y(i))));
yy(i)=(1-exp(-10000*(1-y(i)*y(i))*(1-y(i)*y(i))*(1-y(i)*y(i))));
if(y(i)<0.94)
    yy2(i)=1;
else
    yy2(i)=(0.5+0.5*cos(pi*(y(i)-0.94)/(1-0.94)));
end
end
hold on;
%yyaxis left
plot(y,yy,'k');
ax=gca;
ax.FontSize=20;
axis([-1 1 0 1.02]);
xlabel('X', 'FontSize', 26);
ylabel('V/V_{max}', 'FontSize', 26);

box on;
