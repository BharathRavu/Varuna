function pnt_map=map_1liddisp_steady(pnt,time_length)
global options;
timeprd_1dir=0:time_length/2:time_length;
[~,pnts_steady_roll]=ode15s(@get_vel_vec_pot_cntra_t,timeprd_1dir,pnt,options);
pnt_map=pnts_steady_roll(3,:);                            
end