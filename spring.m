clc; clear all; 
%% initialize necessary variables. 
% This is a one-dimentional spring system. stiffness along the string is not constant. 
% stiffness
k_spring = [100; 80; 90; 50; 30; 70; 100];
% because there are seven segments, number of nodes will be 8.
n_nodes = 8;

% Set time step 
dtSmall = 0.01; 
% Set how much steps will run
nSteps = 150;

% define different systems for each segment. 
syms S1 S2 S3 S4 S5 S6 S7 S8 F1 F2 F3 F4 F5 F6 F7 F8 
S(2, 1) = S2; S(3, 1) = S3; S(4, 1) = S4; S(5, 1) = S5;
S(6, 1) = S6; S(7, 1) = S7; S(8, 1) = S8; 
F(1, 1) = F1; F(2, 1) = 0; F(3, 1) = 0; F(4, 1) = 0;
F(5, 1) = 0; F(6, 1) = 0; F(7, 1) = 0; F(8, 1) = 500; 

%% ELement wise stiffness matrices. 
[row, col] = size(k_spring);

for i = 1:row
	k_element{i} = [k_spring(i) -k_spring(i); -k_spring(i) k_spring(i)]; 
end
% Global stiffness 
K = zeros(row+1, row+1); 
for j = 1:row
	tempK = k_element{1, j}; 
	m = j; 
	n = j+1; 
	K(m,m)=K(m,m)+tempK(1,1);
	K(m,n)=K(m,n)+tempK(1,2);
	K(n,m)=K(n,m)+tempK(2,1);
	K(n,n)=K(n,n)+tempK(2,2);
end

%% Sloving for K*S = F

% finding zero displacement to simplify the matrix. 
z_displacement = find(S==0); 
s = S; 
f = F; 
k = K; 
s(z_displacement, :) = [];
f(z_displacement, :) = []; 
k(z_displacement, :) = []; 
k(:, z_displacement) = []; 

S_solve = k\f; 

S_solve = double(S_solve);

[s_row, s_col] = size(s);
for idx = 1:s_row
	s(idx, 1) = S_solve(idx, 1); 
end 

s = double(s); 
S = [S(z_displacement, 1) ; s]; 
S = double(S); 

% Reaction force 
F(z_displacement, 1) = K(z_displacement, :)*S;

%% displaying matrices 
disp('K = '); disp(K);
disp('S = '); disp(S); 
disp('F = '); disp(F);

%% ploting the deformation
figure (1);
subplot(1,2,1);
plot (S,'-ro','LineWidth',2);

xlabel('Node number');
ylabel('Displacement (S, m)');
set(gca,'XTick',1:1:n_nodes)


subplot(1,2,2);
plot (F,'-go','LineWidth',2);


xlabel('Node number');
ylabel('Force (F, kN)');
set(gca,'XTick',1:1:n_nodes);

perturbation(K); 