function v_car=vel_trans_cyl2cart(p,v_cy)
% p is the point in cylindrical coordinates at which the velocity components
% have to be converted to cartesian components
% p(1)=radius, p(2)=azimuthal angle, p(3)=z
v_car=[ v_cy(1)*cos(p(2)) - v_cy(2)*sin(p(2)) ;
        v_cy(1)*sin(p(2)) + v_cy(2)*cos(p(2)) ;
        v_cy(3)];
end