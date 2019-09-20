function [ newu ] = new_control( u, Qu, Quu, Qux, fx, fu )
N=1000;
h=1;
k=zeros(1,1,N);
K=zeros(1,2,N);
du=zeros(1,N);
newu=zeros(1,N);
dx=zeros(2,N+1);
for i=1:999
    k(:,:,i)   = - Quu(:,:,i)\Qu(:,i);
    K(:,:,i) = - Quu(:,:,i)\Qux(:,:,i);
    du(:,i)  = k(:,i) + K(:,:,i)*dx(:,i);
    dx(:,i+1)= fx(:,:,i)*dx(:,i) + fu(:,i)*du(:,i);
end

for i=1:999
    newu(:,i)=u(:,i)+h*du(:,i);
end

end

