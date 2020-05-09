load HS_exp_vel_pos_grid_100_100_319;
global dvthetadphi_phimax dvthetadrdphi_rmin_phimax dvthetadrdphi_rmax_phimax...
       dvrdphi_phimax dvthetadr_rmin dvthetadr_rmax;


dx=10^-9;

dvthetadphi_phimax_cov=zeros(n_r+1,n_theta+1);
dvthetadphi_phimax=zeros(n_r+1,n_theta+1);
dvthetadtheta_thetamin=zeros(n_r+1,n_phi+1);
dvthetadtheta_thetamax=zeros(n_r+1,n_phi+1);
dvthetadthetadphi_thetamin_phimax=zeros(n_r+1);
dvrdphi_phimax=zeros(n_r+1,n_theta+1);
dvthetadr_rmin=zeros(n_theta+1,n_phi+1);
dvthetadrdphi_rmin_phimax=zeros(n_theta+1);
dvthetadr_rmax=zeros(n_theta+1,n_phi+1);
dvthetadrdphi_rmax_phimax=zeros(n_theta+1);


points_phimax_dx=zeros((n_r+1)*(n_theta+1),3);
points_phimin_dx=zeros((n_r+1)*(n_theta+1),3);
for ir=1:n_r+1
    for itheta=1:n_theta+1
        points_phimax_dx((ir-1)*(n_theta+1)+itheta,:)=[r_vec(ir),theta_vec(itheta),phi_vec(n_phi+1)-dx];
        points_phimin_dx((ir-1)*(n_theta+1)+itheta,:)=[r_vec(ir),theta_vec(itheta),dx];
    end
end
vel_phimax_dx=get_vel_HS_sph_contr(points_phimax_dx);
vel_phimin_dx=get_vel_HS_sph_contr(points_phimin_dx);
for ir=1:n_r+1
    for itheta=1:n_theta+1
        dvthetadphi_phimax_cov(ir,itheta)=-(vel_phimax_dx((ir-1)*(n_theta+1)+itheta,2,2)-vel_sph(ir,itheta,n_phi+1,2))/dx;
        dvthetadphi_phimax(ir,itheta)=dvthetadphi_phimax_cov(ir,itheta)*r_vec(ir)*sin(theta_vec(itheta));
        dvrdphi_phimax(ir,itheta)=-(vel_phimax_dx((ir-1)*(n_theta+1)+itheta,1,1)-vr(ir,itheta,n_phi+1))/dx;
        
    end
    dvthetadthetadphi_thetamin_phimax(ir)=dvthetadphi_phimax_cov(ir,1)*r_vec(ir);
end
for itheta=1:n_theta+1
    dvthetadrdphi_rmin_phimax(itheta)=dvthetadphi_phimax_cov(1,itheta)*sin(theta_vec(itheta));
end

for ir=1:n_r+1
    for iphi=1:n_phi+1
        dvthetadtheta_thetamin(ir,iphi)=vel_sph(ir,1,iphi,2)*r_vec(ir);
        dvthetadtheta_thetamax(ir,iphi)=-vel_sph(ir,n_theta+1,iphi,2)*r_vec(ir);
    end
end

dx=10^-6;

points_rmax_dx=zeros((n_theta+1)*(n_phi+1),3);
vtheta_rmax_dx=zeros(n_theta+1,n_phi+1);
for itheta=1:n_theta+1
    for iphi=1:n_phi+1
        dvthetadr_rmin(itheta,iphi)=vel_sph(1,itheta,iphi,2)*sin(theta_vec(itheta));
        points_rmax_dx((itheta-1)*(n_phi+1)+iphi,:)=[r_vec(n_r+1)-dx,theta_vec(itheta),phi_vec(iphi)];
    end
end
vel_rmax_dx=get_vel_HS_sph_contr(points_rmax_dx);
for itheta=1:n_theta+1
    for iphi=1:n_phi+1
        vtheta_rmax_dx(itheta,iphi)=vel_rmax_dx((itheta-1)*(n_phi+1)+iphi,2,1);
        dvthetadr_rmax(itheta,iphi)=-vel_rmax_dx((itheta-1)*(n_phi+1)+iphi,2,1)/dx;
%         dvthetadr_rmax_cov(itheta,iphi)=-vel_rmax_dx((itheta-1)*(n_phi+1)+iphi,2,2)/dx;
%         dvthetadr_rmax_cov2contr(itheta,iphi)=dvthetadr_rmax_cov(itheta,iphi)*r_vec(n_r+1)*sin(theta_vec(itheta));
    end
end

%symmetrize velocity gradients Xaxis

for itheta=1:n_theta/2+1
    
    dvthetadrdphi_rmin_phimax(itheta)=(dvthetadrdphi_rmin_phimax(itheta)-dvthetadrdphi_rmin_phimax(n_theta+2-itheta))/2;
    dvthetadrdphi_rmin_phimax(n_theta+2-itheta)=-dvthetadrdphi_rmin_phimax(itheta);

    
    
    for ir=1:n_r+1

        dvrdphi_phimax(ir,itheta)=(dvrdphi_phimax(ir,itheta)+dvrdphi_phimax(ir,n_theta+2-itheta))/2;
        dvrdphi_phimax(ir,n_theta+2-itheta)=dvrdphi_phimax(ir,itheta);
        
        dvthetadphi_phimax(ir,itheta)=(dvthetadphi_phimax(ir,itheta)-dvthetadphi_phimax(ir,n_theta+2-itheta))/2;
        dvthetadphi_phimax(ir,n_theta+2-itheta)=-dvthetadphi_phimax(ir,itheta);
    end
    
    for iphi=1:n_phi+1
       dvthetadr_rmin(itheta,iphi)=(dvthetadr_rmin(itheta,iphi)-dvthetadr_rmin(n_theta+2-itheta,iphi))/2;
       dvthetadr_rmin(n_theta+2-itheta,iphi)=-dvthetadr_rmin(itheta,iphi);
       dvthetadr_rmax(itheta,iphi)=(dvthetadr_rmax(itheta,iphi)-dvthetadr_rmax(n_theta+2-itheta,iphi))/2;
       dvthetadr_rmax(n_theta+2-itheta,iphi)=-dvthetadr_rmax(itheta,iphi);
            
    end
end