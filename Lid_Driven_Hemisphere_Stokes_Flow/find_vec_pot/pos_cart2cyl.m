function p_cyl=pos_cart2cyl(p_car)
p_cyl=[sqrt(p_car(1)^2+p_car(2)^2);
       mod(atan2(p_car(2),p_car(1)),2*pi);
       p_car(3)];
end