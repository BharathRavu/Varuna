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

function d2=get_Az_coef()


global vy hx hy hz nx ny nz;


dx=zeros(nx+3,ny+1,nz+1);
dy=zeros(nx+3,ny+3,nz+1);
d2=zeros(nx+3,ny+3,nz+3);

for iy=1:ny+1
   for iz=1:nz+1;
   dx(:,iy,iz)=spline1d_x_vel(hx,-vy(:,iy,iz));
   end
end

for iz=1:nz+1
for ix=1:nx+3
   dy(ix,:,iz)=spline1d_y_A(hy,dx(ix,:,iz));
end
end


for ix=1:nx+3
    for iy=1:ny+3
        d2(ix,iy,:)=spline1d_z_A(hz,dy(ix,iy,:));
    end
end
end