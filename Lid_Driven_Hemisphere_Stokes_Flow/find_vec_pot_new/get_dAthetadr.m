function dAtdr=get_dAthetadr(p)

global h_r h_theta h_phi c n_r n_theta n_phi r_min theta_min phi_min;

[x_cell,f_x]=bas_fun_eval(p(1),r_min,h_r,n_r);
[y_cell,f_y]=bas_fun_eval(p(2),theta_min,h_theta,n_theta);
[z_cell,f_z]=bas_fun_eval(p(3),phi_min,h_phi,n_phi);

dAtdr=0;

for ix=x_cell:x_cell+3
    for iy=y_cell:y_cell+3
        for iz=z_cell:z_cell+3   
            
            dAtdr=dAtdr+c(ix,iy,iz)*f_x(ix-x_cell+1,2)*f_y(iy-y_cell+1,1)*f_z(iz-z_cell+1,1);
        end
      
    end
end
dAtdr=dAtdr/h_r;

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