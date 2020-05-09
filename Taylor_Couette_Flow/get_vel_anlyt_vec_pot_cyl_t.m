function vn=get_vel_anlyt_vec_pot_cyl_t(~,p)

global h_r h_theta h_z c d n_r n_theta n_z r_min theta_min z_min theta_max z_max;

p(2)=mod(p(2),theta_max);
p(3)=mod(p(3)-z_min,z_max-z_min)+z_min;
[x_cell,f_x]=bas_fun_eval(p(1),r_min,h_r,n_r);
[y_cell,f_y]=bas_fun_eval(p(2),theta_min,h_theta,n_theta);
[z_cell,f_z]=bas_fun_eval(p(3),z_min,h_z,n_z);


dAydx=0;
dAydz=0;
dAzdy=0;
dAzdx=0;
for ix=x_cell:x_cell+3
     for iz=z_cell:z_cell+3  
        for iy=y_cell:y_cell+3
                   
            dAydx=dAydx+c(ix,iy,iz)*f_x(ix-x_cell+1,2)*f_y(iy-y_cell+1,1)*f_z(iz-z_cell+1,1);
            dAzdx=dAzdx+d(ix,iy,iz)*f_x(ix-x_cell+1,2)*f_y(iy-y_cell+1,1)*f_z(iz-z_cell+1,1);
            
            dAydz=dAydz+c(ix,iy,iz)*f_x(ix-x_cell+1,1)*f_y(iy-y_cell+1,1)*f_z(iz-z_cell+1,2);
            dAzdy=dAzdy+d(ix,iy,iz)*f_x(ix-x_cell+1,1)*f_y(iy-y_cell+1,2)*f_z(iz-z_cell+1,1);
            
        end     
    end
end

vel1=dAzdy/h_theta-dAydz/h_z;
vel2=-dAzdx/h_r;
vel3=dAydx/h_r;
vn=[vel1;vel2;vel3];
vn=vn/p(1);


function [p_cell,f_p]=bas_fun_eval(pnt,pmin,hp,np)
p_n=(pnt-pmin)/hp;
p_cell=min(floor(p_n+1),np);
f_p=zeros(4,2);

s=p_n-(p_cell-2);
f_p(1,1)=(2-s)^3;
f_p(1,2)=-3*(2-s)^2;
s=s-1;
f_p(2,1)=4-6*s^2+3*s^3;
f_p(2,2)=-12*s+9*s^2;
s=s-1;
f_p(3,1)=4-6*s^2-3*s^3;
f_p(3,2)=-12*s-9*s^2;
s=s-1;
f_p(4,1)=(2+s)^3;
f_p(4,2)=3*(2+s)^2;
end

end