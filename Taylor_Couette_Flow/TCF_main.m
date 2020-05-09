clear all;

global r_min r_max theta_min theta_max z_min z_max n_r n_theta n_z beta;
n_r=50;  % n_r has to be odd
n_theta=50;
n_z=50;   % n_z has to be odd


% beta=5;
% z_min=-1.395;
% z_max= 1.395;
% n_theta=61;
% n_z = 61;
% 
% beta=6;
% z_min=-1.1625;
% z_max=1.1625;

beta=12;
r_min=7.54701;
r_max=8.54701;
theta_min=0;
theta_max=(2*pi)/beta;
z_min=-2.0;
z_max= 2.0;
grid_create;
create_vel_grad;
vec_pot;

%save Spline_pot h_r h_theta h_z c d n_r n_theta n_z r_min theta_min z_min r_max theta_max z_max;

% Instead of saving in matrix, just write data to Spline.dat 

fid=fopen('Spline.dat','w','n','macintosh');
fprintf(fid,'% 3d',n_r,n_theta,n_z);
fprintf(fid,'\n');
fprintf(fid,'% 19.15f',h_r,h_theta,h_z);
fprintf(fid,'\n');
fprintf(fid,'% 19.15f',r_min, theta_min, z_min);
fprintf(fid,'\n');

for k=1:n_z+3
    for j=1:n_theta+3
        fprintf(fid,'% 23.15e',c(:,j,k));
        fprintf(fid,'\n');
    end
end

for k=1:n_z+3
    for j=1:n_theta+3
        fprintf(fid,'% 23.15e',d(:,j,k));
        fprintf(fid,'\n');
    end
end
    
fclose(fid);