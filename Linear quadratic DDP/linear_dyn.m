function [ x, fx, fu ] = linear_dyn( x0,u, N )
%   Dynamics of the linear system with double interator
%   given the initial state and input sequence function generates
%   state sequence

x=zeros(2,N);
x(:,1)=x0;
dt=0.01;
fx=[0 1;0 0]*dt + eye(2);
fu=[0;1]*dt;
for i=1:N-1
    x(:,i+1)=fx*x(:,i)+fu*u(:,i);
end


end

