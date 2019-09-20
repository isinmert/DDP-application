function [ newu ] = new_control( u, Qu, Quu, Qux, N, fx, fu )
%UNTÝTLED2 Summary of this function goes here
%   Detailed explanation goes here

k=zeros(1,1,N);
K=zeros(1,2,N);
du=zeros(1,N-1);
newu=zeros(1,N-1);
dx=zeros(2,N);
for i=1:N-1
    k(:,:,i)   = - Quu(:,:,i)\Qu(:,i);
    K(:,:,i) = - Quu(:,:,i)\Qux(:,:,i);
    du(:,i)  = k(:,i) + K(:,:,i)*dx(:,i);
    dx(:,i+1)= fx*dx(:,i) + fu*du(:,i);
end

for i=1:N-1
    newu(:,i)=u(:,i)+du(:,i);
end

end

