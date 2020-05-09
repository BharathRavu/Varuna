function v_sp=vel_trans_cart2sph(p,v_car)
% p is the point in sphereical coordinates at which the velocity components
% have to be converted to spherical components
% p(1)=radius, p(2)=polar angle, p(3)=azimuthal angle
v_sp=[v_car(1)*sin(p(2))*cos(p(3))+v_car(2)*sin(p(2))*sin(p(3))+v_car(3)*cos(p(2));
      v_car(1)*cos(p(2))*cos(p(3))+v_car(2)*cos(p(2))*sin(p(3))-v_car(3)*sin(p(2));
     -v_car(1)*sin(p(3))+v_car(2)*cos(p(3))];
end