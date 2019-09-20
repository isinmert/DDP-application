function [ ] = pendulum_animation( x )
O=[0 0];
axis(gca,'equal');
axis([-1.5 1.5 -1.5 1.5]);
grid on
for i=1:1000
    P=1*[sin(x(1,i)) -cos(x(1,i))];
    
    pend=line([O(1) P(1)],[O(2) P(2)]);
    
    pause(0.01);
    if i<1000
        
        delete(pend);
        
    end
    end

end

