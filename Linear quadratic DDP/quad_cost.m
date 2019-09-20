function [ Qx, Qu, Qxx, Quu, Qux, Vx, Vxx ] = quad_cost( x, u, N, fx, fu )
%UNTÝTLED3 Summary of this function goes here
%   J(x0)= V(x(N)) + sigma(x(i)^2 + u(i)^2)
xd=[5;0];
V=zeros(N);
Vx=zeros(2,N);
Vxx=zeros(2,2,N);
Qx=zeros(2,N-1);
Qxx=zeros(2,2,N-1);
Qu=zeros(1,N-1);
Quu=zeros(1,1,N-1);
Qux=zeros(1,2,N-1);
lx=zeros(2,N-1);
lu=zeros(1,N-1);
lxx=zeros(2,2,N-1);
luu=zeros(1,1,N-1);
lux=zeros(1,2,N-1);
V(N)  = (xd-x(:,N))'*eye(2)*(xd-x(:,N))*10000000;
Vx(:,N) = -2*eye(2)*(xd-x(:,N))*10000000;
Vxx(:,:,N)=  2*eye(2)*10000000;
for i=N:-1:2
    lx(:,i-1) = 2*x(:,i-1);
    lu(:,i-1) = 2*u(:,i-1)*10;
    lxx(:,:,i-1)=2*eye(2);
    luu(:,:,i-1)=2*10;
    Qx(:,i-1)  = lx(:,i-1)  + (fx')*Vx(:,i);
    Qu(:,i-1)  = lu(:,i-1)  + (fu')*Vx(:,i);
    Qxx(:,:,i-1) = lxx(:,:,i-1) + (fx')*(Vxx(:,:,i))*(fx);
    Qux(:,:,i-1) = lux(:,:,i-1) + (fu')*(Vxx(:,:,i))*(fx);
    Quu(:,:,i-1) = luu(:,:,i-1) + (fu')*(Vxx(:,:,i))*(fu);
    Vx(:,i-1)  = Qx(:,i-1)  - (Qux(:,:,i-1)')*((Quu(:,:,i-1))\Qu(:,i-1));
    Vxx(:,:,i-1) = Qxx(:,:,i-1) - (Qux(:,:,i-1)')*((Quu(:,:,i-1)\Qux(:,:,i-1)));
end


end

