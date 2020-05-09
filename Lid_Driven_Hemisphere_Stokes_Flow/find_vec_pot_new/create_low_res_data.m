clear all;
load HS_exp_vel_pos_grid_160_320_319;

n_theta1=n_theta/2;
vr1=zeros(n_r+1,n_theta1+1,n_phi+1);
vtheta1=zeros(n_r+1,n_theta1+1,n_phi+1);
vphi1=zeros(n_r+1,n_theta1+1,n_phi+1);

vel_sph1=zeros(n_r+1,n_theta1+1,n_phi+1,3);
h_theta1=2*h_theta;


for ir=1:n_r+1
    for itheta=1:n_theta1+1
        for iphi=1:n_phi+1
            vel_sph1(ir,itheta,iphi,:)=vel_sph(ir,2*itheta-1,iphi,:);
            vr1(ir,itheta,iphi)=vr(ir,2*itheta-1,iphi);
            vtheta1(ir,itheta,iphi)=vtheta(ir,2*itheta-1,iphi);
            vphi1(ir,itheta,iphi)=vphi(ir,2*itheta-1,iphi);            
        end
    end
end

clear n_theta vr vtheta vphi vel_sph theta_vec h_theta;
global n_theta vr vtheta vphi vel_sph theta_vec h_theta;
h_theta=h_theta1;
theta_vec=theta_min:h_theta:theta_max;
n_theta=n_theta1;
vr=vr1;
vtheta=vtheta1;
vphi=vphi1;
vel_sph=vel_sph1;

save HS_exp_vel_pos_grid_160_160_319 r_min r_max theta_min theta_max phi_min phi_max h_r h_theta h_phi vr...
     vtheta vphi vel_sph n_r n_theta n_phi r_vec theta_vec phi_vec;
