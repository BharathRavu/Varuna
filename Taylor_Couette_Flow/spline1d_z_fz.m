function cx=spline1d_z_fz(~,fz)
global mat_z n_z;
ff=zeros(n_z+3,1);
for ip=1:n_z+1
ff(ip)=fz(ip);
end
cx=mat_z\ff;
end