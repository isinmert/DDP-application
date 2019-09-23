function [ newu ] = new_control( u, Qu, Quu, Qux, N, fx, fu )
% Given cost matrices Qs system dynamics and nominal cost this function updates
% control input sequence by differential dynamic programming algorithm

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
