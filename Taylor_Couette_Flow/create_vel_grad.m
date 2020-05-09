
global dvthetadr_rmax dvzdr_rmax;
dx=10^-8;
dvthetadr_rmax=zeros(n_theta+1,n_z+1);
dvzdr_rmax=zeros(n_theta+1,n_z+1);

points_rmax_dx=zeros(n_theta+1,n_z+1,3);
points_rmax=zeros(n_theta+1,n_z+1,3);

for itheta=1:n_theta+1
    for iz=1:n_z+1
        points_rmax_dx(itheta,iz,1)=r_max-dx;
        points_rmax_dx(itheta,iz,2)=theta_vec(itheta);
        points_rmax_dx(itheta,iz,3)=z_vec(iz);
        %-----------------------------------------------
        points_rmax(itheta,iz,1)=r_max;
        points_rmax(itheta,iz,2)=theta_vec(itheta);
        points_rmax(itheta,iz,3)=z_vec(iz);
    end
end
vel_rmax_dx=get_contra_vel_2d_plane_semtex(points_rmax_dx);
vel_rmax=get_contra_vel_2d_plane_semtex(points_rmax);

for itheta=1:n_theta+1
    for iz=1:n_z+1
        dvthetadr_rmax(itheta,iz)=(vel_rmax(itheta,iz,2)-vel_rmax_dx(itheta,iz,2))/dx;
        dvzdr_rmax(itheta,iz)=(vel_rmax(itheta,iz,3)-vel_rmax_dx(itheta,iz,3))/dx;
    end
end
%save WVF_grid_vel_grad_8_50_50_50 dvthetadr_rmax dvzdr_rmax;