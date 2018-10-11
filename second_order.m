function dxdt = second_order(t, x1, x0)
    % This is the second term of perturbation term of 
    % non-linear spring-mass system.
    dxdt = [x1(2); -(x1(1)+(2*x1(1)*x0(:, 1)+2*x0(:, 2)];
end