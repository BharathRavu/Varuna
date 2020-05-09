function cx=spline1d_phi_extr(hphi,fphi,dfphimin,dfphimax)
global mat_phi_extr n_phi;
ff=zeros(n_phi+3,1);
for ip=1:n_phi+1
ff(ip)=fphi(ip);
end
ff(n_phi+2)=hphi*dfphimin;
ff(n_phi+3)=hphi*dfphimax;
cx=mat_phi_extr\ff;
end