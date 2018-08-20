clear ; close all; clc
%load('final.mat', 'final');
final = 0;
%% Initialization

krylovIter = 100;
% Set bar dimensions
x = (-2:0.5:2);
y = (-1:0.5:1);
z = (-1:0.5:1);

% Set meshgrid for bar
[X, Y, Z] = meshgrid(x, y, z);

% Set delta t
dtSmall = 0.01;

% Set how much steps will run
nSteps = 150;
% Get all mesh points for X, Y and Z
X = X(:);
Y = Y(:);
Z = Z(:);

% Tetrahedral meshes are reqired for the finite element method
% of elastodynamics material.
% Generates tetrahedral meshes using Delaunay Triengulation mentod.
DT = delaunayTriangulation(X, Y, Z);

% function BigTimeSteps(DT, dtSmall, nSteps, speed, gravity_switch, exForce)
%BigTimeSteps(DT, dtSmall, nSteps, 70, false, 0, final, krylovIter);



CnctList = DT.ConnectivityList;

% Get all points coordinates generated by Delaunay Triangulation method.
V = DT.Points;

% Get boundaryFacets for the mesh bar.
boundaryFacets = freeBoundary(DT);

% Call external FEM interface to get Mass and stiffness(K)
fem = WorldFEM('elastic_linear_tetrahedra', V, CnctList);
% Get mass for the bar
M = mass(fem);
% Get stiffness matrix for the bar
K = 30*stiffness(fem);


