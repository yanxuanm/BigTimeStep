% This function calculates the gravitational force applied on the bar. 

function [gravity] = gravitational(qVector, mass)
    gravity = zeros(size(qVector,1),1);
    gravity((end/2+2):3:end) = 9.8;
    
    %convert acceleration to force using mass matrix 
    gravity((end/2+1):end) = mass*gravity((end/2+1):end);
end