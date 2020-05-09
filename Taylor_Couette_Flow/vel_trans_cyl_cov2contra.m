function v_cntr=vel_trans_cyl_cov2contra(p,v_cov)
% p is the point in sphereical coordinates at which the covariant velocity components
% have to be converted to contravaiant components
% p(1)=radius, p(2)=polar angle, p(3)=azimuthal angle
v_cntr=[v_cov(1)*p(1);
        v_cov(2);
        v_cov(3)*p(1)];
end