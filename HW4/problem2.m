clc;
clear;


% MATLAB code to solve the Lyapunov equation symbolically for given system

% Define symbolic variables
syms k R p11 p12 p22 real

% Define the matrix A symbolically
A = [-(1 + k^2)/R, k; 0, -(2 + k^2)/R];

% Define the symmetric matrix P symbolically
P = [p11, p12; p12, p22];

% Define the matrix Q (identity matrix)
Q = [1, 0; 0, 1];

% Define the Lyapunov equation: A' * P + P * A + Q = 0
Lyap_eq = transpose(A) * P + P * A + Q

% Solve the system of equations
solutions = solve([Lyap_eq(1,1) == 0, Lyap_eq(1,2) == 0, Lyap_eq(2,2) == 0], [p11, p12, p22]);

% Extract solutions
p11_sol = solutions.p11;
p12_sol = solutions.p12;
p22_sol = solutions.p22;

% Display the solutions for P
P_sol = [p11_sol, p12_sol; p12_sol, p22_sol];
disp('Symbolic solution for matrix P:');
disp(P_sol);

% Calculate the eigenvalues of the symbolic matrix P
eigenvalues = eig(P_sol);

% Display the eigenvalues
disp('Eigenvalues of symbolic matrix P:');
disp(eigenvalues);

simplify(eigenvalues)
lamda_1 = simplify(eigenvalues(1))
lamda_2 = simplify(eigenvalues(2))