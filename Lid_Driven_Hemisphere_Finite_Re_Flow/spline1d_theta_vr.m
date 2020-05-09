function cx=spline1d_theta_vr(~,fr)
global mat_theta_vr n_theta;
ff=zeros(n_theta+3,1);
for ip=1:n_theta+1
ff(ip)=fr(ip);
end
cx=mat_theta_vr\ff;
end