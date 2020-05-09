function vn=get_1d_spline_val(xx_min,hh,nn,cc,p)

[x_cell,f_x]=bas_fun_eval(p,xx_min,hh,nn);
SV=0;
for ix=x_cell:x_cell+3
SV=SV+cc(ix)*f_x(ix-x_cell+1,1);
end
vn=SV/hh;



function [p_cell,f_p]=bas_fun_eval(pnt,pmin,hp,np)
p_n=(pnt-pmin)/hp;
p_cell=min(floor(p_n+1),np);
f_p=zeros(4,2);

s=p_n-(p_cell-2);
f_p(1,1)=(2-s)^3;
f_p(1,2)=-3*(2-s)^2;
s=s-1;
f_p(2,1)=4-6*s^2+3*s^3;
f_p(2,2)=-12*s+9*s^2;
s=s-1;
f_p(3,1)=4-6*s^2-3*s^3;
f_p(3,2)=-12*s-9*s^2;
s=s-1;
f_p(4,1)=(2+s)^3;
f_p(4,2)=3*(2+s)^2;
end

end