function c1=get_Atheta_coeff()

global vr h_theta h_phi h_r n_r n_theta n_phi;

cphi=zeros(n_r+1,n_theta+1,n_phi+3);
ctheta=zeros(n_r+1,n_theta+3,n_phi+3);
c1=zeros(n_r+3,n_theta+3,n_phi+3);

for i=1:n_r+1
    for j=1:n_theta+1
         cphi(i,j,:)=spline1d_phi(h_phi,-vr(i,j,:));
    end
end

for i=1:n_r+1
for j=1:n_phi+3
ctheta(i,:,j)=spline1d_theta_vr(h_theta,cphi(i,:,j));
end
end

for i=1:n_theta+3
    for j=1:n_phi+3

        c1(:,i,j)=spline1d_r_vr(h_r,ctheta(:,i,j));
    end
end
end