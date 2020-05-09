function p_car=pos_cyl2cart(p_cyl)
p_car=[p_cyl(1)*cos(p_cyl(2));
       p_cyl(1)*sin(p_cyl(2));
       p_cyl(3)];
end