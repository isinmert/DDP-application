function [x] = pendulum_dynamics( x0, u, T )
dt=0.01;
m=1;
l=1;
g=9.81;
b=1.8;
x = zeros(2,(T/dt));
x(1,1)=x0(1,:);
x(2,1)=x0(2,:);
for i=1:(T/dt)-1
x(1,i+1)=x(1,i) + dt*x(2,i);
x(2,i+1)=x(2,i) + (u(i)/(m*l*l) - ((g/l)*sin(x(1,i)) + b*(1/m*l)*x(2,i)))*dt;
end


end

