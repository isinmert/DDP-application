function [ fx, fu, fxx, fuu, fux ] = linearization( x )
N=1000;
m=1;
l=1;
b=1.8;
g=9.81;
dt=0.01;
fx=zeros(2,2,N);
fu=zeros(2,1,N);
fxx=zeros(2,2,2,N);
fuu=zeros(2,1,1,N);
fux=zeros(2,1,2,N);
for i=1:N
fx(:,:,i)  = [0 1;-(g/l)*cos(x(1,i)) -b/(m*l)]*dt + eye(2);
fu(:,i)  = [0;(1/(m*l*l))]*dt;
fxx(:,:,1,i) = [0 0;(g/l)*sin(x(1,i)) 0]*dt;
fxx(:,:,2,i) = [0 0;0 0]*dt;

end
end

