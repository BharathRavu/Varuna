clear all;
load HS_exp_vel_pos_grid_100_100_319;
matrices;
vel_gradients;

global c d;
c=get_Atheta_coeff();

d=get_Ar_coeff();

save all_HS_exp_100_100_319 c d r_min r_max theta_min theta_max phi_min...
     phi_max h_r h_theta h_phi vr vtheta vphi vel_sph n_r n_theta n_phi...
     r_vec theta_vec phi_vec;