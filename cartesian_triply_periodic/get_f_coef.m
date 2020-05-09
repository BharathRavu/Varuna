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

function e2=get_f_coef()

global vx hy hz ny nz;

ey=zeros(ny+3,nz+1);
e2=zeros(ny+3,nz+3);

for iz=1:nz+1
  ey(:,iz)=spline1d_y_vel(hy,vx(1,:,iz));
end

for iy=1:ny+3
   e2(iy,:)=spline1d_z_A(hz,ey(iy,:));
end

end