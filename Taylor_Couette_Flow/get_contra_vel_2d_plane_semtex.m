function vel_2d_plane=get_contra_vel_2d_plane_semtex(pts_2dplane)
size_vec=size(pts_2dplane);

tot_pnts=size_vec(1)*size_vec(2);
points_tot=zeros(tot_pnts,3);
kk=0;
for i1=1:size_vec(1)
    for i2=1:size_vec(2)
        kk=kk+1;
        for i3=1:size_vec(3)
        points_tot(kk,i3)=pts_2dplane(i1,i2,i3);
        end
    end
end
vel_tot_pnts=get_vel_WVF_cyl_contr(points_tot);
vel_2d_plane=zeros(size_vec(1),size_vec(2),3);
kk=0;
for i1=1:size_vec(1)
    for i2=1:size_vec(2)
        kk=kk+1;
        for i3=1:size_vec(3)
        vel_2d_plane(i1,i2,i3)=vel_tot_pnts(kk,i3,1);
        end
    end
end
end