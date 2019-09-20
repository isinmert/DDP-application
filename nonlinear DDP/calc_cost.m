function [ cost ] = calc_cost( x, u)
N=1000;
xd=[pi;0];
cost=0;
dt=0.01;
A=[100 0;0 1]*dt;
B=1*dt;
K=1000000*eye(2);
for i=1:999
    cost=cost + 0.5*((x(:,i)-xd)'*A*(x(:,i)-xd) + u(:,i)'*B*u(:,i));
end
    cost=cost + (x(:,N)-[pi;0])'*K*(x(:,N)-[pi;0]);
end

