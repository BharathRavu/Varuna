clear all;
load error_vel_120_120_599.mat;
load all_HS_exp_120_120_599;

error_vx=abs(error_vx);
error_vy=abs(error_vy);
error_vz=abs(error_vz);


err_vx_l1=0;
err_vx_l2=0;


err_vy_l1=0;
err_vy_l2=0;


err_vz_l1=0;
err_vz_l2=0;


for i1=1:n_r+1
    for i2=1:n_theta+1
        for i3=1:n_phi+1
            
            err_vx_l1=err_vx_l1+error_vx(i1,i2,i3);
            err_vx_l2=err_vx_l2+(error_vx(i1,i2,i3))^2;
           
            err_vy_l1=err_vy_l1+error_vy(i1,i2,i3);
            err_vy_l2=err_vy_l2+(error_vy(i1,i2,i3))^2;
            
            err_vz_l1=err_vz_l1+error_vz(i1,i2,i3);
            err_vz_l2=err_vz_l2+(error_vz(i1,i2,i3))^2;
            
        end
    end
end
err_vx_l1=err_vx_l1/((n_r+1)*(n_theta+1)*(n_phi+1));
err_vx_l2=err_vx_l2/((n_r+1)*(n_theta+1)*(n_phi+1));
err_vx_l2=sqrt(err_vx_l2);
err_vx_linf=max(max(max(error_vx)));

err_vy_l1=err_vy_l1/((n_r+1)*(n_theta+1)*(n_phi+1));
err_vy_l2=err_vy_l2/((n_r+1)*(n_theta+1)*(n_phi+1));
err_vy_l2=sqrt(err_vy_l2);
err_vy_linf=max(max(max(error_vy)));

err_vz_l1=err_vz_l1/((n_r+1)*(n_theta+1)*(n_phi+1));
err_vz_l2=err_vz_l2/((n_r+1)*(n_theta+1)*(n_phi+1));
err_vz_l2=sqrt(err_vz_l2);
err_vz_linf=max(max(max(error_vz)));
