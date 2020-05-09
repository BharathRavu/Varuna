clear all;
load HS_exp_vel_pos_grid_100_100_319_orgnl.mat;

global vr vtheta vphi;
for ir=1:n_r+1
    for itheta=1:n_theta/2+1
        for iphi=1:n_phi+1
           vr(ir,itheta,iphi)=(vr(ir,itheta,iphi)+vr(ir,n_theta+2-itheta,iphi))/2; 
           vr(ir,n_theta+2-itheta,iphi)=vr(ir,itheta,iphi);
           vtheta(ir,itheta,iphi)=(vtheta(ir,itheta,iphi)-vtheta(ir,n_theta+2-itheta,iphi))/2;
           vtheta(ir,n_theta+2-itheta,iphi)=-vtheta(ir,itheta,iphi);
           vphi(ir,itheta,iphi)=(vphi(ir,itheta,iphi)+vphi(ir,n_theta+2-itheta,iphi))/2;
           vphi(ir,n_theta+2-itheta,iphi)=vphi(ir,itheta,iphi);
        end
    end
end



save HS_exp_vel_pos_grid_100_100_319 r_min r_max theta_min theta_max phi_min phi_max h_r h_theta h_phi vr vtheta vphi vel_sph n_r n_theta n_phi r_vec theta_vec phi_vec r_sph theta_sph phi_sph;