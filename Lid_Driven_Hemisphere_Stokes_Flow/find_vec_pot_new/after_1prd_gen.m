function pos_1prd=after_1prd_gen(pnt)
global RM_Rev no_ornts lid_displacement_time;
for itran=1:no_ornts
pnt= map_1liddisp_steady(pnt,lid_displacement_time);
pnt_end_cart_steady_roll=pos_sph2cart(pnt);
pnt_end_cart_steady_roll_rot=RM_Rev*pnt_end_cart_steady_roll;
pnt=pos_cart2sph(pnt_end_cart_steady_roll_rot); 
end
pos_1prd=pnt;
end