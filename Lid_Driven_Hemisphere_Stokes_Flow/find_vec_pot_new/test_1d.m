%testing 1d
clear all;
load HS_exp_50_3_grid_vel_pos_50_100_99;
matrices;
nnr=22;
nntheta=67;
dff=zeros(n_phi+1,1);
for ii=1:n_phi+1
dff(ii)=vr(nnr,nntheta,ii);
end
cc=spline1d_phi(h_phi,-vr(nnr,nntheta,:));
dff_spline=zeros(n_phi+1,1);
f_v=zeros(n_phi+1,1);
%check after interp
for ii=1:n_phi+1
dff_spline(ii)=-get_1d_dif_spline_val(phi_min,h_phi,n_phi,cc,phi_vec(ii));
f_v(ii)=get_1d_spline_val(phi_min,h_phi,n_phi,cc,phi_vec(ii));
end
plot(f_v)
plot(dff)
diff=dff-dff_spline;