clear all;
load all_HS_exp_4_3_100_160_159;

nn_theta=n_theta*4;
nn_r=n_r*4;
nn_phi=n_phi*4;


htheta_n=(theta_max-theta_min)/nn_theta;
hr_n=(r_max-r_min)/nn_r;
hphi_n=(phi_max-z_min)/nn_phi;
rh_vec=r_min:hr_n:r_max;
thetah_vec=theta_min:htheta_n:theta_max;
phih_vec=phi_min:hphi_n:phi_max;

v_spline_phimin=zeros(nn_r+1,nn_theta+1,3);
v_spline_phimax=zeros(nn_r+1,nn_theta+1,3);
error_vx_phimin=zeros(nn_r+1,nn_theta+1);
error_vx_phimax=zeros(nn_r+1,nn_theta+1);
error_vy_phimin=zeros(nn_r+1,nn_theta+1);
error_vy_phimax=zeros(nn_r+1,nn_theta+1);
error_vz_phimin=zeros(nn_r+1,nn_theta+1);
error_vz_phimax=zeros(nn_r+1,nn_theta+1);
    for iy=1:nn_r+1
        for iz=1:nn_theta+1
            v_spline_phimin(iy,iz,:)=get_vel_vec_pot_cntra(1,[rs(iy,iz),thetas(iy,iz),phi_min]);
            error_vx_phimin(iy,iz)=abs(v_spline_phimin(iy,iz,1));
            error_vy_phimin(iy,iz)=abs(v_spline_phimin(iy,iz,2)-1);
            error_vz_phimin(iy,iz)=abs(v_spline_phimin(iy,iz,3));
            v_spline_phimax(iy,iz,:)=get_vel_vec_pot_cntra(1,[rs(iy,iz),thetas(iy,iz),phi_max]);
            error_vx_phimax(iy,iz)=abs(v_spline_phimax(iy,iz,1));
            error_vy_phimax(iy,iz)=abs(v_spline_phimax(iy,iz,2));
            error_vz_phimax(iy,iz)=abs(v_spline_phimax(iy,iz,3));
        end
    end


err_vx_rmin_l1=0;
err_vx_rmin_l2=0;
err_vx_rmax_l1=0;
err_vx_rmax_l2=0;

err_vy_rmin_l1=0;
err_vy_rmin_l2=0;

err_vy_rmax_l1=0;
err_vy_rmax_l2=0;

err_vz_rmin_l1=0;
err_vz_rmin_l2=0;
err_vz_rmax_l1=0;
err_vz_rmax_l2=0;

% on the boundary

bndry_pnts=(nn_theta+1)*(nn_r+1);

for i1=1:nn_r+1
    for i2=1:nn_theta+1
       
    err_vx_rmin_l1=err_vx_rmin_l1+abs(error_vx_phimin(i1,i2));
    err_vx_rmax_l1=err_vx_rmax_l1+abs(error_vx_phimax(i1,i2));
    err_vx_rmin_l2=err_vx_rmin_l2+(error_vx_phimin(i1,i2))^2;
    err_vx_rmax_l2=err_vx_rmax_l2+(error_vx_phimax(i1,i2))^2;   
    err_vy_rmin_l1=err_vy_rmin_l1+abs(error_vy_phimin(i1,i2));
    err_vy_rmax_l1=err_vy_rmax_l1+abs(error_vy_phimax(i1,i2));            
    err_vy_rmin_l2=err_vy_rmin_l2+(error_vy_phimin(i1,i2))^2;
    err_vy_rmax_l2=err_vy_rmax_l2+(error_vy_phimax(i1,i2))^2;            
    err_vz_rmin_l1=err_vz_rmin_l1+abs(error_vz_phimin(i1,i2));
    err_vz_rmax_l1=err_vz_rmax_l1+abs(error_vz_phimax(i1,i2));            
    err_vz_rmin_l2=err_vz_rmin_l2+(error_vz_phimin(i1,i2))^2;
    err_vz_rmax_l2=err_vz_rmax_l2+(error_vz_phimax(i1,i2))^2; 
    end
end
err_vx_rmin_l1=err_vx_rmin_l1/bndry_pnts;
err_vx_rmin_l2=err_vx_rmin_l2/bndry_pnts;
err_vx_rmin_l2=sqrt(err_vx_rmin_l2);
err_vx_rmin_linf=max(max(error_vx_phimin));

err_vx_rmax_l1=err_vx_rmax_l1/bndry_pnts;
err_vx_rmax_l2=err_vx_rmax_l2/bndry_pnts;
err_vx_rmax_l2=sqrt(err_vx_rmax_l2);
err_vx_rmax_linf=max(max(error_vx_phimax));

err_vy_rmin_l1=err_vy_rmin_l1/bndry_pnts;
err_vy_rmin_l2=err_vy_rmin_l2/bndry_pnts;
err_vy_rmin_l2=sqrt(err_vy_rmin_l2);
err_vy_rmin_linf=max(max(error_vy_phimin));

err_vy_rmax_l1=err_vy_rmax_l1/bndry_pnts;
err_vy_rmax_l2=err_vy_rmax_l2/bndry_pnts;
err_vy_rmax_l2=sqrt(err_vy_rmax_l2);
err_vy_rmax_linf=max(max(error_vy_phimax));

err_vz_rmin_l1=err_vz_rmin_l1/bndry_pnts;
err_vz_rmin_l2=err_vz_rmin_l2/bndry_pnts;
err_vz_rmin_l2=sqrt(err_vz_rmin_l2);
err_vz_rmin_linf=max(max(error_vz_phimin));

err_vz_rmax_l1=err_vz_rmax_l1/bndry_pnts;
err_vz_rmax_l2=err_vz_rmax_l2/bndry_pnts;
err_vz_rmax_l2=sqrt(err_vz_rmax_l2);
err_vz_rmax_linf=max(max(error_vz_phimax));
