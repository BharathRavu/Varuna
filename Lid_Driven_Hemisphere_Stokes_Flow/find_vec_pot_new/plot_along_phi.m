nnr=27;
nntheta=161;
fphi=zeros(n_phi+1,1);
for iphi=1:n_phi+1
    fphi(iphi)=r_vec(nnr)*vel_sph(nnr,nntheta,iphi,2);
end
plot(fphi)