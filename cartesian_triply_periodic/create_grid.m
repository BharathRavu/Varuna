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
global x y z xmin xmax ymin ymax zmin zmax hx hy hz vx vy vz nx ny nz x_vec y_vec z_vec;
nx=41;
ny=41;
nz=41;
xmin=-pi/4;
xmax=7*pi/4;
ymin=-pi/4;
ymax=7*pi/4;
zmin=-pi/4;
zmax=7*pi/4;

hx=(xmax-xmin)/nx;
hy=(ymax-ymin)/ny;
hz=(zmax-zmin)/nz;
[x,y,z]=ndgrid(xmin:hx:xmax,ymin:hy:ymax,zmin:hz:zmax);
vx=zeros(nx+1,ny+1,nz+1);
vy=zeros(nx+1,ny+1,nz+1);
vz=zeros(nx+1,ny+1,nz+1);
x_vec=xmin:hx:xmax;
y_vec=ymin:hy:ymax;
z_vec=zmin:hz:zmax;
alpha=1;
beta=1;
gamma=1;
v_x=@(xx,yy,zz) (cos(xx)*(sin(zz)+cos(yy)));
v_y=@(xx,yy,zz) (sin(yy)*(sin(xx)+cos(zz)));
v_z=@(xx,yy,zz) (-sin(xx)*cos(zz)-sin(zz)*cos(yy));

for ix=1:nx+1
    for iy=1:ny+1
        for iz=1:nz+1
            vx(ix,iy,iz)=v_x(x(ix,iy,iz),y(ix,iy,iz),z(ix,iy,iz));
            vy(ix,iy,iz)=v_y(x(ix,iy,iz),y(ix,iy,iz),z(ix,iy,iz));
            vz(ix,iy,iz)=v_z(x(ix,iy,iz),y(ix,iy,iz),z(ix,iy,iz));
        end
    end
end

save grid_vel_data x y z xmin xmax ymin ymax zmin zmax hx hy hz vx vy vz nx ny nz x_vec y_vec z_vec;
