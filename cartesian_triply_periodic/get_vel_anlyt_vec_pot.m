%    This file is part of Varuna.
% 
%     Varuna is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
% 
%     Varuna is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
% 
%     You should have received a copy of the GNU General Public License
%     along with Varuna.  If not, see <http://www.gnu.org/licenses/>.

function vn=get_vel_anlyt_vec_pot(~,p)

global hx hy hz c d e nx ny nz xmin ymin zmin;

[x_cell,f_x]=bas_fun_eval(p(1),xmin,hx,nx);
[y_cell,f_y]=bas_fun_eval(p(2),ymin,hy,ny);
[z_cell,f_z]=bas_fun_eval(p(3),zmin,hz,nz);


dAydx=0;
dAydz=0;
dAzdy=0;
dAzdx=0;
dfdy=0;

for iz=z_cell:z_cell+3  
    for iy=y_cell:y_cell+3
        for ix=x_cell:x_cell+3
                   
            dAydx=dAydx+c(ix,iy,iz)*f_x(ix-x_cell+1,2)*f_y(iy-y_cell+1,1)*f_z(iz-z_cell+1,1);
            dAzdx=dAzdx+d(ix,iy,iz)*f_x(ix-x_cell+1,2)*f_y(iy-y_cell+1,1)*f_z(iz-z_cell+1,1);
            
            dAydz=dAydz+c(ix,iy,iz)*f_x(ix-x_cell+1,1)*f_y(iy-y_cell+1,1)*f_z(iz-z_cell+1,2);
            dAzdy=dAzdy+d(ix,iy,iz)*f_x(ix-x_cell+1,1)*f_y(iy-y_cell+1,2)*f_z(iz-z_cell+1,1);
            
        end     
        dfdy=dfdy+e(iy,iz)*f_y(iy-y_cell+1,2)*f_z(iz-z_cell+1,1);
    end
end

vel1=dAzdy/hy+dfdy/hy-dAydz/hz;
vel2=-dAzdx/hx;
vel3=dAydx/hx;
vn=[vel1;vel2;vel3];


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