function FF = DeformationTensor(XP1,YP1,ZP1,PROTO,Tau1,Tau2,Tau3,EPS,K,eps,VERBOSE);

% > define grid of 6 points surrounding periodic point:

XF0(1) = XP1 + eps;YF0(1) = YP1;ZF0(1) = ZP1;
XF0(2) = XP1 - eps;YF0(2) = YP1;ZF0(2) = ZP1;
XF0(3) = XP1;YF0(3) = YP1 + eps;ZF0(3) = ZP1;
XF0(4) = XP1;YF0(4) = YP1 - eps;ZF0(4) = ZP1;
XF0(5) = XP1;YF0(5) = YP1;ZF0(5) = ZP1 + eps;
XF0(6) = XP1;YF0(6) = YP1;ZF0(6) = ZP1 - eps;
XF0(7) = XP1;YF0(7) = YP1;ZF0(7) = ZP1;

% > track grid over 1 period:

INT = 1;
%INT = -1;
[XF1,YF1,ZF1] = MappingTracers(XF0,YF0,ZF0,PROTO,Tau1,Tau2,Tau3,EPS,K,INT);

%figure(fig1);
%plot3(XF0,YF0,ZF0,'b*');hold on
%plot3(XF1,YF1,ZF1,'c*');hold on

% > build deformation-tensor:

%    - column 1 : d/dx :

eps1(1) = XF1(1) - XF1(7);eps1(2) = YF1(1) - YF1(7);eps1(3) = ZF1(1) - ZF1(7);
eps2(1) = XF1(2) - XF1(7);eps2(2) = YF1(2) - YF1(7);eps2(3) = ZF1(2) - ZF1(7);

FF(1,1) = (eps1(1) - eps2(1))/(2.0d0*eps);
FF(2,1) = (eps1(2) - eps2(2))/(2.0d0*eps);
FF(3,1) = (eps1(3) - eps2(3))/(2.0d0*eps);

%     - column 2 : d/dy :

eps1(1) = XF1(3) - XF1(7);eps1(2) = YF1(3) - YF1(7);eps1(3) = ZF1(3) - ZF1(7);
eps2(1) = XF1(4) - XF1(7);eps2(2) = YF1(4) - YF1(7);eps2(3) = ZF1(4) - ZF1(7);

FF(1,2) = (eps1(1) - eps2(1))/(2.0d0*eps);
FF(2,2) = (eps1(2) - eps2(2))/(2.0d0*eps);
FF(3,2) = (eps1(3) - eps2(3))/(2.0d0*eps);

%     - column 3 : d/dz :

eps1(1) = XF1(5) - XF1(7);eps1(2) = YF1(5) - YF1(7);eps1(3) = ZF1(5) - ZF1(7);
eps2(1) = XF1(6) - XF1(7);eps2(2) = YF1(6) - YF1(7);eps2(3) = ZF1(6) - ZF1(7);
      
FF(1,3) = (eps1(1) - eps2(1))/(2.0d0*eps);
FF(2,3) = (eps1(2) - eps2(2))/(2.0d0*eps);
FF(3,3) = (eps1(3) - eps2(3))/(2.0d0*eps);

dX = Displacement2(XF1(7),YF1(7),ZF1(7),XF0(7),YF0(7),ZF0(7));

if VERBOSE==0;return;end

disp(['* displacement period-1 point: dX=' num2str(dX)])
