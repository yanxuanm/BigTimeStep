%% KeyFrame force controls animation 

	% This matlab code computes keyframe force which controls the animation. 
	% Combined with matrix exponential time integration.

	
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
boundaryFacets = freeBoundary(DT);
% function BigTimeSteps(DT, dtSmall, nSteps, speed, gravity_switch, exForce)
BigTimeSteps(DT, dtSmall, nSteps, 70, false, 0, final, krylovIter);

