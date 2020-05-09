function v_car=vel_trans_sph2cart(p,v_sp)
% p is the point in sphereical coordinates at which the velocity components
% have to be converted to cartesian components
% p(1)=radius, p(2)=polar angle, p(3)=azimuthal angle
v_car=[v_sp(1)*sin(p(2))*cos(p(3))+v_sp(2)*cos(p(2))*cos(p(3))-v_sp(3)*sin(p(3));
       v_sp(1)*sin(p(2))*sin(p(3))+v_sp(2)*cos(p(2))*sin(p(3))+v_sp(3)*cos(p(3));
       v_sp(1)*cos(p(2))-v_sp(2)*sin(p(2))];
end