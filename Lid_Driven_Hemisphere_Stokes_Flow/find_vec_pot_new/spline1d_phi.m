function cx=spline1d_phi(hphi,dfphi)
global mat_phi n_phi;
ff=zeros(n_phi+3,1);
for ip=1:n_phi+1
ff(ip)=dfphi(ip)*hphi;
end
cx=mat_phi\ff;
end