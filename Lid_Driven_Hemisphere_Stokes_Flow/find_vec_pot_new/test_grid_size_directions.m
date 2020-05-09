clear all;
load error_vel_320_320_159;
tot_num=321*321*160;
er1=sum(sum(sum(abs(error_vz))))/tot_num;

clear error_vz tot_num error_vy error_vx;

load error_vel_320_160_319;
tot_num=321*161*320;
er2=sum(sum(sum(abs(error_vz))))/tot_num;

clear error_vz tot_num error_vy error_vx;

load error_vel_160_320_319;
tot_num=321*161*320;
er3=sum(sum(sum(abs(error_vz))))/tot_num;

clear error_vz tot_num error_vy error_vx;

load error_vel_160_160_319;
tot_num=161*161*320;
er4=sum(sum(sum(abs(error_vz))))/tot_num;

clear error_vz tot_num error_vy error_vx;

