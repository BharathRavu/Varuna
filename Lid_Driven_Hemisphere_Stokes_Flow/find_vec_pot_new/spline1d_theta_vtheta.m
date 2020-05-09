function cx=spline1d_theta_vtheta(htheta,fr,dfr)
global mat_theta_vtheta n_theta;
ff=zeros(n_theta+3,1);
for ip=1:n_theta+1
ff(ip)=fr(ip);
end
ff(n_theta+3)=htheta*dfr;
cx=mat_theta_vtheta\ff;
end