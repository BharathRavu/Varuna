function p_sp=pos_cart2sph(p_car)
rsph=sqrt(p_car(1)^2+p_car(2)^2+p_car(3)^2);
p_sp=[rsph;
    acos(p_car(3)/rsph);
    mod(atan2(p_car(2),p_car(1)),2*pi)];
end