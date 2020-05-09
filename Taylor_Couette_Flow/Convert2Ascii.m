
fid=fopen('Spline.dat','w','n','macintosh');
fprintf(fid,'% 3d',n_r,n_theta,n_z);
fprintf(fid,'\n');
fprintf(fid,'% 14.10f',h_r,h_theta,h_z);
fprintf(fid,'\n');
fprintf(fid,'% 14.10f',r_min, theta_min, z_min);
fprintf(fid,'\n');
for k=1:n_z+3
    for j=1:n_theta+3
        fprintf(fid,'% 18.10e',c(:,j,k));
        fprintf(fid,'\n');
    end
end
for k=1:n_z+3
    for j=1:n_theta+3
        fprintf(fid,'% 18.10e',d(:,j,k));
        fprintf(fid,'\n');
    end
end
    
fclose(fid);

