function cx=spline1d_r_dfr(hr,dfr,frmax)
global mat_r n_r;
ff=zeros(n_r+3,1);
for ip=1:n_r+1
ff(ip)=dfr(ip)*hr;
end
ff(n_r+3)=frmax*(hr^2/6);
cx=mat_r\ff;
end