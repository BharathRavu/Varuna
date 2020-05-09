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

clear all;
global x y z xmin xmax ymin ymax zmin zmax hx hy hz vx vy vz nx ny nz....
       dvxdz_zmax dvydz_zmax x_vec y_vec z_vec;
nx=100;
ny=100;
nz=100;
xmin=-pi/4;
xmax=7*pi/4;
ymin=-pi/4;
ymax=7*pi/4;
zmin=0;
zmax=1;

hx=(xmax-xmin)/nx;
hy=(ymax-ymin)/ny;
hz=(zmax-zmin)/nz;
[x,y,z]=ndgrid(xmin:hx:xmax,ymin:hy:ymax,zmin:hz:zmax);

vx=zeros(nx+1,ny+1,nz+1);
vy=zeros(nx+1,ny+1,nz+1);
vz=zeros(nx+1,ny+1,nz+1);
dvxdz_zmax=zeros(nx+1,ny+1);
dvydz_zmax=zeros(nx+1,ny+1);

x_vec=xmin:hx:xmax;
y_vec=ymin:hy:ymax;
z_vec=zmin:hz:zmax;
alpha=1;
beta=1;
gamma=1;

% model analytical velocity field

v_x=@(xx,yy,zz) -sin(xx)*sin(yy)*zz;
v_y=@(xx,yy,zz) -cos(xx)*cos(yy)*(1-zz);
v_z=@(xx,yy,zz) cos(xx)*sin(yy)*(zz^2-zz);

dvxdz=@(xx,yy,zz) -sin(xx)*sin(yy);
dvydz=@(xx,yy,zz) cos(xx)*cos(yy);

for ix=1:nx+1
    for iy=1:ny+1
        dvxdz_zmax(ix,iy)=dvxdz(x(ix,iy,nz+1),y(ix,iy,nz+1),zmax);
        dvydz_zmax(ix,iy)=dvydz(x(ix,iy,nz+1),y(ix,iy,nz+1),zmax);
        for iz=1:nz+1
            vx(ix,iy,iz)=v_x(x(ix,iy,iz),y(ix,iy,iz),z(ix,iy,iz));
            vy(ix,iy,iz)=v_y(x(ix,iy,iz),y(ix,iy,iz),z(ix,iy,iz));
            vz(ix,iy,iz)=v_z(x(ix,iy,iz),y(ix,iy,iz),z(ix,iy,iz));
        end
    end
end

save grid_vel_data x y z xmin xmax ymin ymax zmin zmax hx hy hz vx vy vz...
     dvxdz_zmax dvydz_zmax nx ny nz x_vec y_vec z_vec;
