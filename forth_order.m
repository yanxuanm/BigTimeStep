function dxdt = forth_order(t, x3, x2, x1, x0)
    % This is the second term of perturbation term of 
    % non-linear spring-mass system.
    dxdt = [x3(2); -(x3(1)+2*(x3(1)*x0(:, 1)+x1(:, 1)*x2(:, 1))+2*x2(:, 2))];
end