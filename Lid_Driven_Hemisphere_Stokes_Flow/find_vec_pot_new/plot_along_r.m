clear all;
load all_HS_exp_120_120_599;
%load HS_exp_160_160_319_matlab_cubic_int;
theta=pi/2;
phi=pi/2;
%phi=(phi_max-phi_min)*rand+phi_min;
r=0:0.001:0.999;
nr=length(r);
points_all=zeros(nr,3);
for i=1:nr   
points_all(i,:)=[r(i),theta,phi];
end
v_smtx=get_vel_HS_sph_contr(points_all);
%v_cbc_int=zeros(nr,3);
v_nm=zeros(nr,3);
for i=1:nr
    v_nm(i,:)=get_vel_vec_pot_cntra(1,[r(i),theta,phi]);
    %v_cbc_int(i,:)=[Fvx(r(i),theta,phi),Fvy(r(i),theta,phi),Fvz(r(i),theta,phi)];
end
dif_vel=v_nm-v_smtx(:,:,1);
%dif_vel_mat_cbc_int=v_cbc_int-v_smtx(:,:,1);
%plot(r,dif_vel(:,3),'.b',r,dif_vel_mat_cbc_int(:,3),'.m');

plot(r,v_nm(:,3),'.b',r,v_smtx(:,3),'.m');