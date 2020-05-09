clear all;
load all_HS_exp_100_100_319;

% random checking
m=10000;
prand=zeros(m,3);


vp1=zeros(m,3);
vp2=zeros(m,3);
vp3=zeros(m,3);
vpthert_rmax=zeros(m,1);
vr_rmin=zeros(m,1);
vr_rmax=zeros(m,1);
vtheta_thetamin=zeros(m,1);
vtheta_thetamax=zeros(m,1);
vphi_phimin=zeros(m,1);
vphi_phimax=zeros(m,1);

for i=1:m
    prand(i,1)=r_min+rand*(r_max-r_min);
    prand(i,2)=theta_min+rand*(theta_max-theta_min);
    prand(i,3)=phi_min+rand*(phi_max-phi_min);
    
    prand_rmin=[0,prand(i,2),prand(i,3)];
    prand_rmax=[1,prand(i,2),prand(i,3)];
    prand_thetamin=[prand(i,1),0,prand(i,3)];
    prand_thetamax=[prand(i,1),pi,prand(i,3)];
    prand_phimin=[prand(i,1),prand(i,2),0];
    prand_phimax=[prand(i,1),prand(i,2),pi];
    
    v_rmin=get_vel_vec_pot(1,prand_rmin);
    v_rmax=get_vel_vec_pot(1,prand_rmax);
    v_thetamin=get_vel_vec_pot(1,prand_thetamin);
    v_thetamax=get_vel_vec_pot(1,prand_thetamax);
    v_phimin=get_vel_vec_pot(1,prand_phimin);
    v_phimax=get_vel_vec_pot(1,prand_phimax);
    
    vr_rmin(i)=v_rmin(1);
    vr_rmax(i)=v_rmax(1);
    vtheta_thetamin(i)=v_thetamin(2);
    vtheta_thetamax(i)=v_thetamax(2);
    vphi_phimin(i)=v_phimin(3);
    vphi_phimax(i)=v_phimax(3);

    
end



