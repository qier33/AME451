clc;
clear;

A = [-2 0 0; 0 1 0; 0 0 -1];
B = [1; 0; -1];
C = [1 1 0];
D = 1;

e = eig(A)

syms s;
R = inv(s * eye(3) - A)
H = C * R * B + D


