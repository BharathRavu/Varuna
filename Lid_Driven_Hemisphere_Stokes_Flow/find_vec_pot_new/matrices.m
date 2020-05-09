global mat_phi mat_phi2 mat_r_vr mat_theta_vr mat_r_vtheta mat_theta_vtheta mat_phi_extr...
       mat_phi_extr2 mat_theta_prdc mat_r_vtheta2;

for i=1:n_phi+1
 mat_phi(i,i)=-3;
 mat_phi(i,i+1)=0;
 mat_phi(i,i+2)=3;
end
mat_phi(n_phi+2,1)=1;
mat_phi(n_phi+2,2)=4;
mat_phi(n_phi+2,3)=1;
mat_phi(n_phi+3,1)=1;
mat_phi(n_phi+3,2)=-2;
mat_phi(n_phi+3,3)=1;
mat_phi(n_phi+3,n_phi+1)=-1;
mat_phi(n_phi+3,n_phi+2)=2;
mat_phi(n_phi+3,n_phi+3)=-1;

for i=1:n_phi+1
 mat_phi2(i,i)=-3;
 mat_phi2(i,i+1)=0;
 mat_phi2(i,i+2)=3;
end
mat_phi2(n_phi+2,1)=1;
mat_phi2(n_phi+2,2)=4;
mat_phi2(n_phi+2,3)=1;
mat_phi2(n_phi+3,1)=1;
mat_phi2(n_phi+3,2)=-2;
mat_phi2(n_phi+3,3)=1;
mat_phi2(n_phi+3,n_phi+1)=1;
mat_phi2(n_phi+3,n_phi+2)=-2;
mat_phi2(n_phi+3,n_phi+3)=1;

mat_phi_extr=zeros(n_phi+3,n_phi+3);
for i=1:n_phi+1
 mat_phi_extr(i,i)=1;
 mat_phi_extr(i,i+1)=4;
 mat_phi_extr(i,i+2)=1;
end
mat_phi_extr(n_phi+2,1)=-3;
mat_phi_extr(n_phi+2,2)=0;
mat_phi_extr(n_phi+2,3)=3;
mat_phi_extr(n_phi+3,n_phi+1)=-3;
mat_phi_extr(n_phi+3,n_phi+2)=0;
mat_phi_extr(n_phi+3,n_phi+3)=3;
% mat_phi_extr(n_phi+2,1)=1;
% mat_phi_extr(n_phi+2,2)=-2;
% mat_phi_extr(n_phi+2,3)=1;
% mat_phi_extr(n_phi+3,n_phi+1)=1;
% mat_phi_extr(n_phi+3,n_phi+2)=-2;
% mat_phi_extr(n_phi+3,n_phi+3)=1;

mat_r_vr=zeros(n_r+3,n_r+3);
for i=1:n_r+1
    mat_r_vr(i,i)=1;
    mat_r_vr(i,i+1)=4;
    mat_r_vr(i,i+2)=1;
end
mat_r_vr(n_r+2,1)=-3;
mat_r_vr(n_r+2,2)=0;
mat_r_vr(n_r+2,3)=3;
mat_r_vr(n_r+3,n_r+1)=-3;
mat_r_vr(n_r+3,n_r+2)=0;
mat_r_vr(n_r+3,n_r+3)=3;

mat_theta_vr=zeros(n_theta+3,n_theta+3);
for i=1:n_theta+1
    mat_theta_vr(i,i)=1;
    mat_theta_vr(i,i+1)=4;
    mat_theta_vr(i,i+2)=1;
end
mat_theta_vr(n_theta+2,1)=-3;
mat_theta_vr(n_theta+2,2)=0;
mat_theta_vr(n_theta+2,3)=3;
% mat_theta_vr(n_theta+2,n_theta+1)=3;
% mat_theta_vr(n_theta+2,n_theta+2)=0;
% mat_theta_vr(n_theta+2,n_theta+3)=-3;
% mat_theta_vr(n_theta+3,1)=1;
% mat_theta_vr(n_theta+3,2)=-2;
% mat_theta_vr(n_theta+3,3)=1;
mat_theta_vr(n_theta+3,n_theta+1)=-3;
mat_theta_vr(n_theta+3,n_theta+2)=0;
mat_theta_vr(n_theta+3,n_theta+3)=3;

mat_r_vtheta=zeros(n_r+3,n_r+3);
for i=1:n_r+1
    mat_r_vtheta(i,i)=1;
    mat_r_vtheta(i,i+1)=4;
    mat_r_vtheta(i,i+2)=1;
end
mat_r_vtheta(n_r+2,1)=-3;
mat_r_vtheta(n_r+2,2)=0;
mat_r_vtheta(n_r+2,3)=3;
mat_r_vtheta(n_r+3,n_r+1)=-3;
mat_r_vtheta(n_r+3,n_r+2)=0;
mat_r_vtheta(n_r+3,n_r+3)=3;

mat_r_vtheta2=zeros(n_r+3,n_r+3);
for i=1:n_r+1
    mat_r_vtheta2(i,i)=1;
    mat_r_vtheta2(i,i+1)=4;
    mat_r_vtheta2(i,i+2)=1;
end
mat_r_vtheta2(n_r+2,1)=-3;
mat_r_vtheta2(n_r+2,2)=0;
mat_r_vtheta2(n_r+2,3)=3;
mat_r_vtheta2(n_r+3,n_r+1)=-3;
mat_r_vtheta2(n_r+3,n_r+2)=0;
mat_r_vtheta2(n_r+3,n_r+3)=3;

mat_theta_vtheta=zeros(n_theta+3,n_theta+3);
for i=1:n_theta+1
    mat_theta_vtheta(i,i)=1;
    mat_theta_vtheta(i,i+1)=4;
    mat_theta_vtheta(i,i+2)=1;
end
mat_theta_vtheta(n_theta+2,1)=-3;
mat_theta_vtheta(n_theta+2,2)=0;
mat_theta_vtheta(n_theta+2,3)=3;
mat_theta_vtheta(n_theta+2,n_theta+1)=3;
mat_theta_vtheta(n_theta+2,n_theta+2)=0;
mat_theta_vtheta(n_theta+2,n_theta+3)=-3;
% mat_theta_vtheta(n_theta+3,1)=1;
% mat_theta_vtheta(n_theta+3,2)=-2;
% mat_theta_vtheta(n_theta+3,3)=1;
% mat_theta_vtheta(n_theta+3,n_theta+1)=-1;
% mat_theta_vtheta(n_theta+3,n_theta+2)=2;
% mat_theta_vtheta(n_theta+3,n_theta+3)=-1;
mat_theta_vtheta(n_theta+3,1)=-3;
mat_theta_vtheta(n_theta+3,2)=0;
mat_theta_vtheta(n_theta+3,3)=3;

mat_theta_prdc=zeros(n_theta+3,n_theta+3);
for i=1:n_theta+1
    mat_theta_prdc(i,i)=1;
    mat_theta_prdc(i,i+1)=4;
    mat_theta_prdc(i,i+2)=1;
end
mat_theta_prdc(n_theta+2,1)=-3;
mat_theta_prdc(n_theta+2,2)=0;
mat_theta_prdc(n_theta+2,3)=3;
mat_theta_prdc(n_theta+2,n_theta+1)=3;
mat_theta_prdc(n_theta+2,n_theta+2)=0;
mat_theta_prdc(n_theta+2,n_theta+3)=-3;
mat_theta_prdc(n_theta+3,1)=1;
mat_theta_prdc(n_theta+3,2)=-2;
mat_theta_prdc(n_theta+3,3)=1;
mat_theta_prdc(n_theta+3,n_theta+1)=-1;
mat_theta_prdc(n_theta+3,n_theta+2)=2;
mat_theta_prdc(n_theta+3,n_theta+3)=-1;

mat_phi_extr2=zeros(n_phi+3,n_phi+3);
for i=1:n_phi+1
 mat_phi_extr2(i,i)=1;
 mat_phi_extr2(i,i+1)=4;
 mat_phi_extr2(i,i+2)=1;
end
mat_phi_extr2(n_phi+2,1)=-3;
mat_phi_extr2(n_phi+2,2)=0;
mat_phi_extr2(n_phi+2,3)=3;
mat_phi_extr2(n_phi+3,1)=-3;
mat_phi_extr2(n_phi+3,2)=0;
mat_phi_extr2(n_phi+3,3)=3;
mat_phi_extr2(n_phi+3,n_phi+1)=3;
mat_phi_extr2(n_phi+3,n_phi+2)=0;
mat_phi_extr2(n_phi+3,n_phi+3)=-3;
