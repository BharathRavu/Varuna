clear all;
load WVF_vector_pot;

ini=[7.41,0.397935,1.31-1.1625];
time_period=0:0.1:200;

options = odeset('RelTol',1e-9,'AbsTol',[1e-10 1e-10 1e-10]);
[t,x]=ode45(@get_vel_anlyt_vec_pot_cyl_t,time_period,ini,options);

n=length(x(:,1));
x_cart=zeros(n,3);
for i=1:n
x_cart(i,:)=pos_cyl2cart(x(i,:));
end
plot3(x_cart(:,1),x_cart(:,2),x_cart(:,3),'.');
