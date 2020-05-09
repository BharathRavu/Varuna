function p_car=pos_sph2cart(p_sp)
p_car=[p_sp(1)*sin(p_sp(2))*cos(p_sp(3));
       p_sp(1)*sin(p_sp(2))*sin(p_sp(3));
       p_sp(1)*cos(p_sp(2))];
end