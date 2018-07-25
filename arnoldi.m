function [Q,H] = arnoldi(A,u,m)
% ARNOLDI   Arnoldi iteration for Krylov subspaces.
% Input:
%   A    square matrix (n by n)
%   u    initial vector
%   m    number of iterations
% Output: 
%   Q    orthonormal basis of Krylov space (n by m+1)
%   H    upper Hessenberg matrix, A*Q(:,1:m)=H (m+1 by m)

n = length(A);
Q = zeros(n,m+1);  H = zeros(m+1,m);

if norm(u) < 1e-16
    return
end

Q(:,1) = u/norm(u);
for j = 1:m
  v = A*Q(:,j);
  for i = 1:j
    H(i,j) = Q(:,i)'*v;
    v = v - H(i,j)*Q(:,i);
  end
  H(j+1,j) = norm(v);
  Q(:,j+1) = v/H(j+1,j);
end