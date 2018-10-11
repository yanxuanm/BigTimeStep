function dxdt = third_order(t, x2, x1, x0)
    % This is the second term of perturbation term of 
    % non-linear spring-mass system.
    dxdt = [x2(2); -(x2(1)+(2*x2(1)*x0(:, 1))+x1(:, 1)^2+2*x1(:, 2)];
end