%----to get velocity from semtex---------------
function vel_points_cyl_contr_cov=get_vel_WVF_cyl_contr(points_cyl)
ns=length(points_cyl(:,1));
fid = fopen('pts_WVF_cyl.dat','wt');
  for is=1:ns
       fprintf(fid,'%14.13f %14.13f %14.13f',points_cyl(is,3),points_cyl(is,1),points_cyl(is,2)); 
       fprintf(fid,'\n'); 
  end
fclose(fid);
command='probe -p pts_WVF_cyl.dat -s WVF WVF.fld>vel_WVF_cyl.dat';
status1 = system(command);
vel_file{1} = importdata('vel_WVF_cyl.dat');
v1=vel_file{1,1};
vel_points_cyl=zeros(ns,3);
vel_points_cyl_contr=zeros(ns,3);
for is=1:ns
%vel_points_cyl(is,:)=[v1(is,4+2),v1(is,4+3),v1(is,4+1)];
vel_points_cyl(is,:)=[v1(is,2),v1(is,3),v1(is,1)];
vel_points_cyl_contr(is,:)=vel_trans_cyl_cov2contra(points_cyl(is,:),vel_points_cyl(is,:));
end
vel_points_cyl_contr_cov=zeros(ns,3,2);
vel_points_cyl_contr_cov(:,:,1)=vel_points_cyl_contr;
vel_points_cyl_contr_cov(:,:,2)=vel_points_cyl;
end                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             