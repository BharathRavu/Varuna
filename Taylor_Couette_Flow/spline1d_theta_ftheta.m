function cx=spline1d_theta_ftheta(~,ftheta)
global mat_theta n_theta;
ff=zeros(n_theta+3,1);
for ip=1:n_theta+1
ff(ip)=ftheta(ip);
end
cx=mat_theta\ff;
end