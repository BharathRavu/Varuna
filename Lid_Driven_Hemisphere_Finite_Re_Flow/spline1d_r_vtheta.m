function cx=spline1d_r_vtheta(hr,fr,dfrmin,dfrmax)
global mat_r_vtheta n_r;
ff=zeros(n_r+3,1);
for ip=1:n_r+1
ff(ip)=fr(ip);
end
ff(n_r+2)=dfrmin*hr;
ff(n_r+3)=dfrmax*hr;
cx=mat_r_vtheta\ff;
end