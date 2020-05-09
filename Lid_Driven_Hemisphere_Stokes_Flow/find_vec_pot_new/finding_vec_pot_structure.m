clear all;
load('all_HS_exp_100_100_320.mat');
load('HS_exp_vel_pos_grid_100_100_320.mat');
Ar=zeros(n_r+1,n_theta+1);
Atheta=zeros(n_r+1,n_theta+1);
div=zeros(n_r+1,n_theta+1,3);
dArdtheta=zeros(n_r+1,n_theta+1);
dAthetadr=zeros(n_r+1,n_theta+1);
for ir=1:n_r+1
    for itheta=1:n_theta+1
        avec=get_vec_pot([r_vec(ir),theta_vec(itheta),pi]);
        Ar(ir,itheta)=avec(1);
        Atheta(ir,itheta)=avec(2);
        div(ir,itheta,:)=get_dvrdr_dvthetadtheta_dvphidphi([r_vec(ir),theta_vec(itheta),0])...
             +get_dvrdr_dvthetadtheta_dvphidphi([r_vec(ir),theta_vec(itheta),pi]);
        Ard=get_dArdtheta_dAthetadr([r_vec(ir),theta_vec(itheta),pi]);
        dArdtheta(ir,itheta)=Ard(1);
        dAthetadr(ir,itheta)=Ard(2);
        
    end
end
Arphi=zeros(n_phi+1,1);
Athetaphi=zeros(n_phi+1,1);

for iphi=1:n_phi+1
            avec=get_vec_pot([r_vec(1),theta_vec(15),phi_vec(iphi)]);
        Arphi(iphi)=avec(1);
        Athetaphi(iphi)=avec(2);
end