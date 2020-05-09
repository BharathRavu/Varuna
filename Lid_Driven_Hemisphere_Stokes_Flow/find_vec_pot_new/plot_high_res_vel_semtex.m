clear all;
load HS_exp_4_3_grid_vel_pos_80_100_99;

r_point=0.5;
theta_point=theta_vec(22);
phi_point=0.5;
r_hs_vec=0:0.001:0.999;
nnr=length(r_hs_vec);
points_r=zeros(nnr,3);
for i=1:nnr
    points_r(i,:)=[r_hs_vec(i),theta_point,phi_point];
end

vel_r=get_vel_HS_sph_contr(points_r);
plot(r_hs_vec,vel_r(:,2));