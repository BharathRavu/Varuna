function cx=spline1d_r_vr(hr,fr)
global mat_r_vr n_r;
ff=zeros(n_r+3,1);
for ip=1:n_r+1
ff(ip)=fr(ip);
end
cx=mat_r_vr\ff;
end