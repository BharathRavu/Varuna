%----to get velocity from semtex---------------
function vel_points_sph_contr_cov=get_vel_HS_sph_contr(points_sph)
ns=length(points_sph(:,1));

points_cart=zeros(ns,3);
points_rot_cart=zeros(ns,3);
points_rot_cyl=zeros(ns,3);
for is=1:ns
points_cart(is,:)=pos_sph2cart(points_sph(is,:));
points_rot_cart(is,:)=[points_cart(is,1),points_cart(is,3),-points_cart(is,2)];
points_rot_cyl(is,:)=pos_cart2cyl(points_rot_cart(is,:));
end

  fid = fopen('pts_HS_cyl.dat','wt');
  for is=1:ns
       fprintf(fid,'%14.13f %14.13f %14.13f',-points_rot_cyl(is,3),points_rot_cyl(is,1),points_rot_cyl(is,2)); 
       fprintf(fid,'\n'); 
  end
fclose(fid);
command='probe -p pts_HS_cyl.dat -s HS HS.fld>vel_HS_cyl.dat';
status1 = system(command);
vel_file{1} = importdata('vel_HS_cyl.dat');
v1=vel_file{1,1};
v1(:,5)=-v1(:,5);
vel_points_sph=zeros(ns,3);
vel_points_cart=zeros(ns,3);
vel_points_rot_cart=zeros(ns,3);
vel_points_rot_cyl=zeros(ns,3);
vel_points_sph_contr=zeros(ns,3);
for is=1:ns
vel_points_rot_cyl(is,:)=[v1(is,4+2),v1(is,4+3),v1(is,4+1)];
vel_points_rot_cart(is,:)=vel_trans_cyl2cart(points_rot_cyl(is,:),vel_points_rot_cyl(is,:));
vel_points_cart(is,:)=[vel_points_rot_cart(is,1),-vel_points_rot_cart(is,3),vel_points_rot_cart(is,2)];
vel_points_sph(is,:)=vel_trans_cart2sph(points_sph(is,:),vel_points_cart(is,:));
vel_points_sph_contr(is,:)=vel_trans_sph_cov2contra(points_sph(is,:),vel_points_sph(is,:));
end
vel_points_sph_contr_cov=zeros(ns,3,2);
vel_points_sph_contr_cov(:,:,1)=vel_points_sph_contr;
vel_points_sph_contr_cov(:,:,2)=vel_points_sph;
save all_vel_exp_50_3_n50_100_100 vel_points_rot_cyl vel_points_rot_cart vel_points_cart vel_points_sph vel_points_sph_contr;
end