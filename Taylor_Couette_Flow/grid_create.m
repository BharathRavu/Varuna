
global h_r h_theta h_z;

h_r=(r_max-r_min)/(n_r);
h_theta=(theta_max-theta_min)/(n_theta);
h_z=(z_max-z_min)/(n_z);

global r_cyl theta_cyl z_cyl vel_cyl r_vec theta_vec z_vec;
r_vec=r_min:h_r:r_max;
theta_vec=theta_min:h_theta:theta_max;
z_vec=z_min:h_z:z_max;
[r_cyl,theta_cyl,z_cyl]=ndgrid(r_min:h_r:r_max,theta_min:h_theta:theta_max,z_min:h_z:z_max);
points_on_grid=zeros((n_r+1)*(n_theta+1)*(n_z+1),3);
k=0;
for i_r=1:n_r+1
    for i_theta=1:n_theta+1
        for i_z=1:n_z+1
            k=k+1;
  points_on_grid(k,:)=[r_vec(i_r),theta_vec(i_theta),z_vec(i_z)];
           
        end
    end
end
vel_on_grid=get_vel_WVF_cyl_contr(points_on_grid);
vel_cntr_cyl=zeros(n_r+1,n_theta+1,n_z+1,3);
vel_cyl=zeros(n_r+1,n_theta+1,n_z+1,3);
k=0;
for i_r=1:n_r+1
    for i_theta=1:n_theta+1
        for i_z=1:n_z+1
            k=k+1;
  vel_cntr_cyl(i_r,i_theta,i_z,1)=vel_on_grid(k,1,1);
   vel_cntr_cyl(i_r,i_theta,i_z,2)=vel_on_grid(k,2,1);
    vel_cntr_cyl(i_r,i_theta,i_z,3)=vel_on_grid(k,3,1);
      vel_cyl(i_r,i_theta,i_z,1)=vel_on_grid(k,1,2);
   vel_cyl(i_r,i_theta,i_z,2)=vel_on_grid(k,2,2);
    vel_cyl(i_r,i_theta,i_z,3)=vel_on_grid(k,3,2);
        end
    end
end
global vr vtheta vz;
vr=vel_cntr_cyl(:,:,:,1);
vtheta=vel_cntr_cyl(:,:,:,2);
vz=vel_cntr_cyl(:,:,:,3);

% 
% save WVF_grid_vel_pos_50_50_50 r_min r_max theta_min theta_max z_min z_max h_r h_theta h_z vr... 
%      vtheta vz vel_cyl n_r n_theta n_z r_cyl theta_cyl z_cyl r_vec theta_vec z_vec;