clear all;
load Spline_pot;


m=10000;
prand=zeros(m,3);
for i=1:m
    prand(i,:)=r_min+rand*(r_max-r_min);
    prand(i,2)=theta_min+rand*(theta_max-theta_min);
   prand(i,3)=z_min+rand*(z_max-z_min);
end
vel_rand=get_vel_WVF_cyl_contr(prand);

vy_spline_rand=zeros(m,1);
vx_spline_rand=zeros(m,1);
vz_spline_rand=zeros(m,1);


for i=1:m
    vpr=get_vel_anlyt_vec_pot_cyl(1,prand(i,:));
    
    vx_spline_rand(i)=vpr(1);
    vy_spline_rand(i)=vpr(2);
     vz_spline_rand(i)=vpr(3);

end

err_rand_vy=abs(vy_spline_rand-vel_rand(:,2,1));
err_rand_vx=abs(vx_spline_rand-vel_rand(:,1,1));
err_rand_vz=abs(vz_spline_rand-vel_rand(:,3,1));
err_vx_avg=sum(err_rand_vx)/m;
err_vy_avg=sum(err_rand_vy)/m;
err_vz_avg=sum(err_rand_vz)/m;

rmax_plane_rand=zeros(m,3);
for i=1:m
    rmax_plane_rand(i,:)=r_max;
    rmax_plane_rand(i,2)=theta_min+rand*(theta_max-theta_min);
   rmax_plane_rand(i,3)=z_min+rand*(z_max-z_min);
end
vel_rmax_rand=get_vel_WVF_cyl_contr(rmax_plane_rand);
vr_rmax_rand=vel_rmax_rand(:,1,1);
