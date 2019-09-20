function [ x ] = linear_dynamics( x0,xd,T )
dt=0.01;
N=T/dt;
m=1;
b=1;
Kp=20;
Kd=1;
u=zeros(1,1000);
x=zeros(2,1000);
x(1,1)=x0(1,:);
x(2,1)=x0(2,:);
fx=[0 1;0 -b/m]*dt + eye(2);
fu=[0;1/m]*dt;
for i=1:N-1
    x(:,i+1) = fx*x(:,i) + fu*u(:,i);
    u(:,i+1) = (xd-x(1,i))*Kp + (-x(2,i))*Kd;
end


end

