function dxdt = first_order(t, x0)
    % This is the first term of perturbation term of 
    % non-linear spring-mass system.
    dxdt = [x0(2); -(x0(1)+x0(1)^2)];
    
end