function v_cov=vel_trans_sph_contra2cov(p,v_ntr)
% p is the point in sphereical coordinates at which the contravariant velocity components
% have to be converted to covariant components
% p(1)=radius, p(2)=polar angle, p(3)=azimuthal angle
v_cov=[v_ntr(1)/(p(1)^2*sin(p(2)));
        v_ntr(2)/(p(1)*sin(p(2)));
        v_ntr(3)/p(1)];
end