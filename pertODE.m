
function pertODE()
 tspan   = 0:0.1:200;
 IC      = [1 1];
 epsilon = 0.05;
 [t,X] = ode45(@myODE,tspan,IC,[],epsilon);
 x     = X(:,1);
 v     = X(:,2);
 plot(t,x,'r')
 xlabel('t')
 ylabel('x')
 grid
 end
 function dY = myODE(t,y,epsilon)
 dY = zeros(2,1);
 x  = y(1);
 v  = y(2);
 dY = [ v;...
       -x - epsilon*t*x];
 end
