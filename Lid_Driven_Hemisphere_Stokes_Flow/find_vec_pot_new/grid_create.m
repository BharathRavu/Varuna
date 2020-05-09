%------------------------constants considered in the code----------------------%
clear all;
global r_min r_max theta_min theta_max phi_min phi_max h_r h_theta h_phi n_r n_theta n_phi;


n_r=100;
n_theta=100;
n_phi=319;
r_min=0;
r_max=1;
theta_min=0;
theta_max=pi;
phi_min=0;
phi_max=pi;

h_r=(r_max-r_min)/(n_r);
h_theta=(theta_max-theta_min)/(n_theta);
h_phi=(phi_max-phi_min)/(n_phi);

global r_sph theta_sph phi_sph vel_sph r_vec theta_vec phi_vec;
r_vec=r_min:h_r:r_max;
theta_vec=theta_min:h_theta:theta_max;
phi_vec=phi_min:h_phi:phi_max;
[r_sph,theta_sph,phi_sph]=ndgrid(r_min:h_r:r_max,theta_min:h_theta:theta_max,phi_min:h_phi:phi_max);
points_on_grid=zeros(n_r*(n_theta+1)*(n_phi+1),3);
k=0;
for i_r=1:n_r
    for i_theta=1:n_theta+1
        for i_phi=1:n_phi+1
            k=k+1;
  points_on_grid(k,:)=[r_sph(i_r,i_theta,i_phi),theta_sph(i_r,i_theta,i_phi),phi_sph(i_r,i_theta,i_phi)];
           
        end
    end
end
vel_on_grid=get_vel_HS_sph_contr(points_on_grid);
vel_cntr_sph=zeros(n_r+1,n_theta+1,n_phi+1,3);
vel_sph=zeros(n_r+1,n_theta+1,n_phi+1,3);
k=0;
for i_r=1:n_r
    for i_theta=1:n_theta+1
        for i_phi=1:n_phi+1
            k=k+1;
  vel_cntr_sph(i_r,i_theta,i_phi,1)=vel_on_grid(k,1,1);
   vel_cntr_sph(i_r,i_theta,i_phi,2)=vel_on_grid(k,2,1);
    vel_cntr_sph(i_r,i_theta,i_phi,3)=vel_on_grid(k,3,1);
      vel_sph(i_r,i_theta,i_phi,1)=vel_on_grid(k,1,2);
   vel_sph(i_r,i_theta,i_phi,2)=vel_on_grid(k,2,2);
    vel_sph(i_r,i_theta,i_phi,3)=vel_on_grid(k,3,2);
        end
    end
end
global vr vtheta vphi;
vr=vel_cntr_sph(:,:,:,1);
vtheta=vel_cntr_sph(:,:,:,2);
vphi=vel_cntr_sph(:,:,:,3);
save HS_exp_vel_pos_grid_100_100_319_orgnl r_min r_max theta_min theta_max phi_min phi_max h_r h_theta h_phi vr vtheta vphi vel_sph n_r n_theta n_phi r_vec theta_vec phi_vec r_sph theta_sph phi_sph;