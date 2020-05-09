% creaing hemisphere

clear all;
[xx,yy]=meshgrid(-1.1:0.01:1.1,-1.1:0.01:1.1);
zero_mat=zeros(size(xx));
[theta,phi]=meshgrid(0:0.01:pi,0:0.01:pi);
X=sin(theta).*cos(phi);
Z=cos(theta);
Y=sin(theta).*sin(phi);
hold on;
surf(X,Z,-Y,'FaceAlpha',0.3,'EdgeAlpha',1);
surf(xx,yy,zero_mat,'FaceAlpha',.3,'EdgeAlpha',1)
%surface(xx,yy,zero_mat)
shading flat
hold off;
axis equal tight;
axis off;
view(3); 
%axis vis3d tight
%view(360-70,40)
colormap(gray);

hold off