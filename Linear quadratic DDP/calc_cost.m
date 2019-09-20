function [ cost ] = calc_cost( x, u, N )
%UNTÝTLED Summary of this function goes here
%   Detailed explanation goes here
    cost=0;
    xd=[5;0];
    A=eye(2);
    B=1*10;
    C=eye(2)*10000000;
    dt=0.01;
    for i=1:N-1
    cost=cost+ (x(:,i)'*A*x(:,i) + u(:,i)'*B*u(:,i))*dt;
    end
    cost=cost+ (xd-x(:,N))'*C*(xd-x(:,N))
end

