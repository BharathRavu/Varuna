% plotting vector potential

clear all;
load all_HS_exp_50_3_80_160_159;

nnr=floor(rand*n_r)+1;
nnphi=floor(rand*n_phi)+1;
dff=zeros(n_phi+1,1);

AAA=zeros(n_theta+1,3);
for ii=1:n_theta+1
AAA(ii,:)=get_vec_pot(1,[r_vec(nnr),theta_vec(ii),phi_vec(nnphi)]);
end

plot(AAA(:,1));