clear all;
load all_HS_exp_100_100_319;

% random checking
m=10000;
prand1=zeros(m,3);
prand2=zeros(m,3);
prand3=zeros(m,3);
prand4=zeros(m,3);

vp1=zeros(m,3);
vp2=zeros(m,3);
vp3=zeros(m,3);
vp4=zeros(m,3);

for i=1:m
    prand1(i,1)=r_min+rand*(r_max-r_min);
    prand1(i,2)=theta_min+rand*(theta_max/2-theta_min);
    prand1(i,3)=phi_min+rand*(phi_max/2-phi_min);
    
    prand2(i,:)=[prand1(i,1),prand1(i,2),pi-prand1(i,3)];
    prand3(i,:)=[prand1(i,1),pi-prand1(i,2),pi-prand1(i,3)];
    prand4(i,:)=[prand1(i,1),pi-prand1(i,2),prand1(i,3)];
    
    vp1(i,:)=get_vel_vec_pot(1,prand1(i,:));
    vp2(i,:)=get_vel_vec_pot(1,prand2(i,:));
    vp3(i,:)=get_vel_vec_pot(1,prand3(i,:));
    vp4(i,:)=get_vel_vec_pot(1,prand4(i,:));
    
end

% X axis symmetry

err_vr_rand_Xaxis=zeros(m,1);
err_vtheta_rand_Xaxis=zeros(m,1);
err_vphi_rand_Xaxis=zeros(m,1);

for i=1:m
err_vr_rand_Xaxis(i)=(abs(vp2(i,1)-vp3(i,1))+abs(vp1(i,1)-vp4(i,1)));
err_vtheta_rand_Xaxis(i)=(abs(vp2(i,2)+vp3(i,2))+abs(vp1(i,2)+vp4(i,2)));
err_vphi_rand_Xaxis(i)=(abs(vp2(i,3)-vp3(i,3))+abs(vp1(i,3)-vp4(i,3)));
end

% % Z axis symmetry
% err_vr_rand_Zaxis=zeros(m,1);
% err_vtheta_rand_Zaxis=zeros(m,1);
% err_vphi_rand_Zaxis=zeros(m,1);
% 
% for i=1:m
% err_vr_rand_Zaxis(i)=(abs(vp1(i,1)+vp2(i,1))+abs(vp3(i,1)+vp4(i,1)));
% err_vtheta_rand_Zaxis(i)=(abs(vp1(i,2)+vp2(i,2))+abs(vp3(i,2)+vp4(i,2)));
% err_vphi_rand_Zaxis(i)=(abs(vp1(i,3)-vp2(i,3))+abs(vp3(i,3)-vp4(i,3)));
% end


