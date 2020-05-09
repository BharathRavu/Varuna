clear all;
load all_HS_exp_100_100_319_Re_pt005;

global RM_Rev no_ornts lid_displacement_time options;
options = odeset('RelTol',1e-10,'AbsTol',[1e-10 1e-10 1e-10]);
no_ornts=8;
lid_displacement_time=16;

nr=25;
ntheta=50;
nphi=50;

angle_displacement=2*pi/no_ornts;
sym_plane_angle=pi/2-angle_displacement/2;
theta_1rot=angle_displacement;
RM_Rev=[cos(theta_1rot) 0 sin(theta_1rot);
         0 1 0;
         -sin(theta_1rot) 0 cos(theta_1rot)];
r_max=1;
theta_max=pi;
phi_max=pi;

hr=(r_max-r_min)/(nr);
htheta=(theta_max-theta_min)/(ntheta+1);
hphi=(phi_max-phi_min)/(nphi+1);

rvec=hr:hr:r_max;
thetavec=htheta:htheta:theta_max-htheta;
phivec=hphi:hphi:phi_max-hphi;

dx=zeros(nr,ntheta,nphi);

for ir=1:nr-1
    ir
    for itheta=1:ntheta
        for iphi=1:nphi
            pt_i=[rvec(ir),thetavec(itheta),phivec(iphi)];
            pt_f=after_1prd_gen(pt_i);
            dx(ir,itheta,iphi)=norm(pos_sph2cart(pt_f)-pos_sph2cart(pt_i));
        end
    end
end
save ini_guess_P1_dx_field_no_ornts_8_lid_disp_16_Re_pt005 dx rvec thetavec phivec nr ntheta nphi...
                           no_ornts lid_displacement_time options;