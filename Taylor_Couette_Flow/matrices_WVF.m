
global mat_theta mat_r mat_z;

mat_r=zeros(n_r+3,n_r+3);
for i=1:n_r+1
    mat_r(i,i)=-3;
    mat_r(i,i+1)=0;
    mat_r(i,i+2)=3;
end
mat_r(n_r+2,1)=1;
mat_r(n_r+2,2)=4;
mat_r(n_r+2,3)=1;
mat_r(n_r+3,n_r+1)=1;
mat_r(n_r+3,n_r+2)=-2;
mat_r(n_r+3,n_r+3)=1;

mat_z=zeros(n_z+3,n_z+3);
for i=1:n_z+1
    mat_z(i,i)=1;
    mat_z(i,i+1)=4;
    mat_z(i,i+2)=1;
end
mat_z(n_z+2,1)=-3;
mat_z(n_z+2,2)=0;
mat_z(n_z+2,3)=3;
mat_z(n_z+2,n_z+1)=3;
mat_z(n_z+2,n_z+2)=0;
mat_z(n_z+2,n_z+3)=-3;

mat_z(n_z+3,1)=1;
mat_z(n_z+3,2)=-2;
mat_z(n_z+3,3)=1;
mat_z(n_z+3,n_z+1)=-1;
mat_z(n_z+3,n_z+2)=2;
mat_z(n_z+3,n_z+3)=-1;

mat_theta=zeros(n_theta+3,n_theta+3);
for i=1:n_theta+1
    mat_theta(i,i)=1;
    mat_theta(i,i+1)=4;
    mat_theta(i,i+2)=1;
end
mat_theta(n_theta+2,1)=-3;
mat_theta(n_theta+2,2)=0;
mat_theta(n_theta+2,3)=3;
mat_theta(n_theta+2,n_theta+1)=3;
mat_theta(n_theta+2,n_theta+2)=0;
mat_theta(n_theta+2,n_theta+3)=-3;

mat_theta(n_theta+3,1)=1;
mat_theta(n_theta+3,2)=-2;
mat_theta(n_theta+3,3)=1;
mat_theta(n_theta+3,n_theta+1)=-1;
mat_theta(n_theta+3,n_theta+2)=2;
mat_theta(n_theta+3,n_theta+3)=-1;
