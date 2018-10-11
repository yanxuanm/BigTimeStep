clear all; close all; clc;


[t, x0] = ode45(@first_order, [0, 3], [1; 0]);
subplot(1, 3, 1)
plot(t,x0(:,1),'-o',t,x0(:,2),'-o')
title('Solution of first_order with ODE45');
xlabel('Time t');
ylabel('Solution x0');
legend('x0_1','x0_2')

[t, x1] = ode45(@second_order, [0, 3], [0; 0], x0);

subplot(1, 3, 2)
plot(t,x1(:,1),'-o',t,x1(:,2),'-o')
title('Solution of second_order with ODE45');
xlabel('Time t');
ylabel('Solution x1');
legend('x1_1','x1_2')