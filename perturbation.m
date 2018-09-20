


function pertODE()
 tspan   = 0:0.1:100;
 IC      = [1 1];
 epsilon = 0.01;
 [t,X] = ode45(@myODE,tspan,IC,[],epsilon);
 x     = X(:,1);
 v     = X(:,2);
 plot(t,x,'r')
 xlabel('t')
 ylabel('x')
 grid
 hold on
h = pi/6;
tspan = (0:h:36*pi);

k = 20; 
m = 100; 
a = 1;


F = @(t, y) [y(2); -(k/m)*y(1)-(a/m)*y(2)];
y0 = [0; 1];

ode45(F, tspan, y0);
end

function dY = myODE(t,y,epsilon)
k = 10; 
m = 100; 
a = 10;
dY = zeros(2,1);
x  = y(1);
v  = y(2);
dY = [v; -(k/m)*x-epsilon*t*x];

end
 

function ODE()
 h = pi/6;
tspan = (0:h:36*pi);

k = 10; 
m = 100; 
a = 10;


F = @(t, y) [y(2); -(k/m)*y(1)-(a/m)*y(2)];
y0 = [0; 1];

ode45(F, tspan, y0);
end
% subplot(1, 2, 1)
% plot(t, y(:,1), 'b-');
% subplot(1, 2, 2)
% plot(t, y(:,2), 'r-');
%function F = linearK(tspan)