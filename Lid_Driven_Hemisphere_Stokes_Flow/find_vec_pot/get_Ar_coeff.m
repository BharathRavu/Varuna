function d1=get_Ar_coeff()

global vtheta h_theta h_phi h_r n_r n_theta n_phi vel_sph r_vec vphi;
global dvthetadr_rmin dvthetadr_rmax;
global dvthetadphi_phimax dvthetadrdphi_rmin_phimax dvthetadrdphi_rmax_phimax;
dphi=zeros(n_r+1,n_theta+1,n_phi+3);
dtheta=zeros(n_r+1,n_theta+3,n_phi+3);
d1=zeros(n_r+3,n_theta+3,n_phi+3);

for i=1:n_r+1
    for j=1:n_theta+1
         dphi(i,j,:)=spline1d_phi(h_phi,vtheta(i,j,:),dvthetadphi_phimax(i,j));
    end
end

dvthetadtheta_thetamin_phimin=zeros(n_r+1,1);
dvthetadtheta_thetamin_phimax=zeros(n_r+1,1);
for ir=1:n_r+1
dvthetadtheta_thetamin_phimin(ir)=r_vec(i)*vel_sph(i,1,1,2);
dvthetadtheta_thetamin_phimax(ir)=r_vec(i)*vel_sph(i,1,n_phi+1,2);
dvthetadtheta_thetamin_phimin(ir)=(dvthetadtheta_thetamin_phimin(ir)-dvthetadtheta_thetamin_phimax(ir))/2;
dvthetadtheta_thetamin_phimax(ir)=-dvthetadtheta_thetamin_phimin(ir);
end



for i=1:n_r+1

dv_dtheta=spline1d_phi_extr(h_phi,-vphi(i,1,:),dvthetadtheta_thetamin_phimin(i),...
            dvthetadtheta_thetamin_phimax(i));

        
for j=1:n_phi+3
    
dtheta(i,:,j)=spline1d_theta_vtheta(h_theta,dphi(i,:,j),dv_dtheta(j));
%dtheta(i,:,j)=spline1d_theta_prdc(h_theta,dphi(i,:,j));
end

end

dv_drmin_phi=zeros(n_theta+1,n_phi+3);
dv_drmax_phi=zeros(n_theta+1,n_phi+3);
dv_drmin=zeros(n_theta+3,n_phi+3);
dv_drmax=zeros(n_theta+3,n_phi+3);
for i=1:n_theta+1
    dv_drmin_phi(i,:)=spline1d_phi(h_phi,dvthetadr_rmin(i,:),dvthetadrdphi_rmin_phimax(i));
    dv_drmax_phi(i,:)=spline1d_phi(h_phi,dvthetadr_rmax(i,:),dvthetadrdphi_rmax_phimax(i));
end
for i=1:n_phi+3
    dv_drmin(:,i)=spline1d_theta_prdc(h_theta,dv_drmin_phi(:,i));
    dv_drmax(:,i)=spline1d_theta_prdc(h_theta,dv_drmax_phi(:,i));
end
for i=1:n_theta+3

    for j=1:n_phi+3

        d1(:,i,j)=spline1d_r_vtheta(h_r,dtheta(:,i,j),dv_drmin(i,j),dv_drmax(i,j));
        %d1(:,i,j)=spline1d_r_vtheta2(h_r,dtheta(:,i,j));
    end
end
end