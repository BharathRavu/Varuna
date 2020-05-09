function cx=spline1d_phi_extr2(hphi,fphi,dfphimin)
global mat_phi_extr2 n_phi;
ff=zeros(n_phi+3,1);
for ip=1:n_phi+1
ff(ip)=fphi(ip);
end
ff(n_phi+2)=hphi*dfphimin;
cx=mat_phi_extr2\ff;
end