clear all;
load all_HS_exp_100_100_319;

% global Fvx Fvy Fvz;
% Fvx = griddedInterpolant(r_sph,theta_sph,phi_sph,vr,'spline');
% Fvy = griddedInterpolant(r_sph,theta_sph,phi_sph,vtheta,'spline');
% Fvz = griddedInterpolant(r_sph,theta_sph,phi_sph,vphi,'spline');
% save HS_exp_50_3_n160_160_320_matlab_spline_int Fvx Fvy Fvz;
% random checking
m=10000;
prand=zeros(m,3);
for i=1:m
    prand(i,1)=r_min+rand*(r_max-r_min);
    prand(i,2)=theta_min+rand*(theta_max-theta_min);
    prand(i,3)=phi_min+rand*(phi_max-phi_min);
end

vy_spline_rand=zeros(m,1);
vx_spline_rand=zeros(m,1);
vz_spline_rand=zeros(m,1);
% vy_mspline_rand=zeros(m,1);
% vx_mspline_rand=zeros(m,1);
% vz_mspline_rand=zeros(m,1);
vx1=zeros(m,1);
vy1=zeros(m,1);
vz1=zeros(m,1);

vel_rand=get_vel_HS_sph_contr(prand);
for i=1:m
    vpr=get_vel_vec_pot_cntra(1,prand(i,:));
    
    vx_spline_rand(i)=vpr(1);
    vy_spline_rand(i)=vpr(2);
     vz_spline_rand(i)=vpr(3);
%       vy_mspline_rand(i)=Fvy(prand(i,1),prand(i,2),prand(i,3));
%     vx_mspline_rand(i)=Fvx(prand(i,1),prand(i,2),prand(i,3));
%      vz_mspline_rand(i)=Fvz(prand(i,1),prand(i,2),prand(i,3));

end

err_rand_vy=abs(vy_spline_rand-vel_rand(:,2));
err_rand_vx=abs(vx_spline_rand-vel_rand(:,1));
err_rand_vz=abs(vz_spline_rand-vel_rand(:,3));
% err_rand_mvx=abs(vx_mspline_rand-vel_rand(:,1));
% err_rand_mvy=abs(vy_mspline_rand-vel_rand(:,2));
% err_rand_mvz=abs(vz_mspline_rand-vel_rand(:,3));

err_vx_avg=sum(err_rand_vx)/1000;
err_vy_avg=sum(err_rand_vy)/1000;
err_vz_avg=sum(err_rand_vz)/1000;