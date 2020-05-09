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
    
global matx maty maty2 matz;

matx=zeros(nx+3,nx+3);
for i=1:nx+1
    matx(i,i)=-3;
    matx(i,i+1)=0;
    matx(i,i+2)=3;
end
matx(nx+2,1)=1;
matx(nx+2,2)=4;
matx(nx+2,3)=1;
matx(nx+3,1)=1;
matx(nx+3,2)=-2;
matx(nx+3,3)=1;
matx(nx+3,nx+1)=-1;
matx(nx+3,nx+2)=2;
matx(nx+3,nx+3)=-1;

maty=zeros(ny+3,ny+3);
for i=1:ny+1
    maty(i,i)=1;
    maty(i,i+1)=4;
    maty(i,i+2)=1;
end
maty(ny+2,1)=-3;
maty(ny+2,2)=0;
maty(ny+2,3)=3;
maty(ny+2,ny+1)=3;
maty(ny+2,ny+2)=0;
maty(ny+2,ny+3)=-3;

maty(ny+3,1)=1;
maty(ny+3,2)=-2;
maty(ny+3,3)=1;
maty(ny+3,ny+1)=-1;
maty(ny+3,ny+2)=2;
maty(ny+3,ny+3)=-1;

matz=zeros(nz+3,nz+3);
for i=1:nz+1
    matz(i,i)=1;
    matz(i,i+1)=4;
    matz(i,i+2)=1;
end
matz(nz+2,1)=-3;
matz(nz+2,2)=0;
matz(nz+2,3)=3;
matz(nz+2,nz+1)=3;
matz(nz+2,nz+2)=0;
matz(nz+2,nz+3)=-3;

matz(nz+3,1)=1;
matz(nz+3,2)=-2;
matz(nz+3,3)=1;
matz(nz+3,nz+1)=-1;
matz(nz+3,nz+2)=2;
matz(nz+3,nz+3)=-1;

maty2=zeros(ny+3,ny+3);
for i=1:ny+1
    maty2(i,i)=-3;
    maty2(i,i+1)=0;
    maty2(i,i+2)=3;
end
maty2(ny+2,1)=1;
maty2(ny+2,2)=4;
maty2(ny+2,3)=1;

maty2(ny+3,1)=1;
maty2(ny+3,2)=-2;
maty2(ny+3,3)=1;
maty2(ny+3,ny+1)=-1;
maty2(ny+3,ny+2)=2;
maty2(ny+3,ny+3)=-1;