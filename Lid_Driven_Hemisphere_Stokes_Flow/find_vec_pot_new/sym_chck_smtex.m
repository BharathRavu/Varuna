clear all;
load HS_exp_vel_pos_grid_160_160_479_orgnl;
v_sym_Xaxs=zeros(n_r+1,n_theta/2+1,n_phi+1,3);
v_sym_Zaxs=zeros(n_r+1,n_theta+1,(n_phi+1)/2,3);

for ir=1:n_r+1
    for itheta=1:n_theta/2+1
        for iphi=1:n_phi+1
           v_sym_Xaxs(ir,itheta,iphi,1)=(vr(ir,itheta,iphi)-vr(ir,n_theta+2-itheta,iphi))/2; 
           v_sym_Xaxs(ir,itheta,iphi,2)=(vtheta(ir,itheta,iphi)+vtheta(ir,n_theta+2-itheta,iphi))/2;
           v_sym_Xaxs(ir,itheta,iphi,3)=(vphi(ir,itheta,iphi)-vphi(ir,n_theta+2-itheta,iphi))/2;
        end
    end
end

for ir=1:n_r+1
    for itheta=1:n_theta+1
        for iphi=1:(n_phi+1)/2
           v_sym_Zaxs(ir,itheta,iphi,1)=(vr(ir,itheta,iphi)+vr(ir,itheta,n_phi+2-iphi))/2; 
           v_sym_Zaxs(ir,itheta,iphi,2)=(vtheta(ir,itheta,iphi)+vtheta(ir,itheta,n_phi+2-iphi))/2;
           v_sym_Zaxs(ir,itheta,iphi,3)=(vphi(ir,itheta,iphi)-vphi(ir,itheta,n_phi+2-iphi))/2;
        end
    end
end
Xaxis=max(max(max(max(v_sym_Xaxs))))
Zaxis=max(max(max(max(v_sym_Zaxs))))
