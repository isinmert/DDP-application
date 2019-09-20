function [ cost, final_x, final_u ] = DDP(  )
    cost(1:100)=0;
    u=zeros(1,999);
    x0=[0;0];
    T=10;
    x=pendulum_dynamics(x0, u, T);
    for i= 1:100
    [fx, fu, fxx, fuu, fux]=linearization(x);
    [Qx, Qu, Qxx, Quu,Qux] = cost_function(x, u, fx, fu, fxx, fuu, fux);
    u = new_control( u, Qu, Quu, Qux, fx, fu );
    x=pendulum_dynamics(x0,u,T);
    cost(i)=calc_cost(x,u);
    end
    final_x=x;
    final_u=u;

end

