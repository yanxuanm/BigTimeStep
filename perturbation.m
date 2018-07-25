function [f, lambda] = perturbation(D, epsilon)

% Dg(x) = lamba*g(x)
% D = D(0) + epsilon*D(1)

[eigV, eigD] = eig(D);
D1 = diff(D);

lambda = eigD + epsilon*int(eigV*D1*eigV, x);

%Create system matrices A,B
A = [-fxp -fyp];
B = [fx fy];
NK = size(fx,2);

%Complex Schur Decomposition
[s,t,q,z] = qz(A,B);   

%Pick non-explosive (stable) eigenvalues
slt = (abs(diag(t))<stake*abs(diag(s)));  
nk=sum(slt);

%Reorder the system with stable eigs in upper-left
[s,t,q,z] = ordqz(s,t,q,z,slt);   

%Split up the results appropriately
z21 = z(nk+1:end,1:nk);
z11 = z(1:nk,1:nk);

s11 = s(1:nk,1:nk);
t11 = t(1:nk,1:nk);


end