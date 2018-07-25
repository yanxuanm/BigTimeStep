function [rQ, eigV, eigD] = eigReduced(Atilde, q0p, nk)
    [rQ,H0] = arnoldi(Atilde, q0p, nk); %this code doesn't work that well 
    H0 = H0(1:end-1,:);
    rQ = rQ(:,1:(end-1));
    [eigV, eigD] = eig(H0);
end