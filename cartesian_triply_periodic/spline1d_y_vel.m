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

function cx1=spline1d_y_vel(hy1,vel1)
% np should be odd number
global maty2 ny ;
ff=zeros(ny+3,1);
for ip=1:ny+1
ff(ip)=vel1(ip)*hy1;
end
cx1=maty2\ff;
end