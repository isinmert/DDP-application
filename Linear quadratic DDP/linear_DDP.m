function [ x, newu, cost1, cost2 ] = linear_DDP( N )
% main function that evaluates and updates the control sequence running main
% body iteratively will converge to the optimal control sequence
x0=[0;0];
u=zeros(1,N);
[ x, fx, fu ] = linear_dyn( x0,u, N );
[ cost1 ] = calc_cost( x, u, N );
[ ~, Qu, ~, Quu, Qux, ~, ~ ] = quad_cost( x, u, N, fx, fu );
[ newu ] = new_control( u, Qu, Quu, Qux, N, fx, fu );
[ x, ~, ~ ] = linear_dyn( x0,newu, N );
[ cost2 ] = calc_cost( x, u, N );


end
