clear all;

load all_HS_exp_100_100_319;
v_spline=zeros(n_r+1,n_theta+1,n_phi+1,3);
for ix=1:n_r+1
    for iy=1:n_theta+1
        for iz=1:n_phi+1
            v_spline(ix,iy,iz,:)=get_vel_vec_pot_cntra(1,[r_vec(ix),theta_vec(iy),phi_vec(iz)]);
        end
    end
end
error_vx1=(vr-v_spline(:,:,:,1));
error_vy1=(vtheta-v_spline(:,:,:,2));
error_vz1=(vphi-v_spline(:,:,:,3));
save error_vel_100_100_319 error_vx1 error_vy1 error_vz1
error_vx=abs(error_vx1);
error_vy=abs(error_vy1);
error_vz=abs(error_vz1);
max(max(max(error_vx)))
max(max(max(error_vy)))
max(max(max(error_vz)))

