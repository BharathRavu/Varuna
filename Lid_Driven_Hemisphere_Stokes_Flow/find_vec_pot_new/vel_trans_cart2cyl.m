function v_cy=vel_trans_cart2cyl(p,v_car)
% p is the point in cylindrical coordinates at which the velocity components
% have to be converted to cylindrical components
% p(1)=radius, p(2)=azimuthal angle, p(3)=z
v_cy=[ v_car(1)*cos(p(2)) + v_car(2)*sin(p(2)) ;
      -v_car(1)*sin(p(2)) + v_car(2)*cos(p(2)) ;
       v_car(3)];
end