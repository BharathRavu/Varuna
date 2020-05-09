function c1=get_Atheta_coeff()


global vz h_theta h_z h_r n_r n_theta n_z dvzdr_rmax;

cr=zeros(n_r+3,n_theta+1,n_z+1);
cz=zeros(n_r+3,n_theta+1,n_z+3);
c1=zeros(n_r+3,n_theta+3,n_z+3);

for itheta=1:n_theta+1
for iz=1:n_z+1
   cr(:,itheta,iz)=spline1d_r_dfr(h_r,vz(:,itheta,iz),dvzdr_rmax(itheta,iz));
end
end

for itheta=1:n_theta+1
for ir=1:n_r+3
    cz(ir,itheta,:)=spline1d_z_fz(h_z,cr(ir,itheta,:));
end
end

for ir=1:n_r+3
    for iz=1:n_z+3
        c1(ir,:,iz)=spline1d_theta_ftheta(h_theta,cz(ir,:,iz));
    end
end
end