clc;
clear;

A2 = [1 1 0; 0 0 1; 0 0 1];

syms z s;

Rz = inv(z * eye(3) - A2)
Rs = inv(s * eye(3) - A2)

iztrans(Rz)
ilaplace(Rs)

