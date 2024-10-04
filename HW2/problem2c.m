clc;
clear;

syms z k

A = [0 1; -0.5 0.3]; 
I = eye(2);
R_z = inv(z * I - A);
zR_z = z * R_z;

Phi_11 = iztrans(zR_z(1,1), z, k);
Phi_12 = iztrans(zR_z(1,2), z, k);
Phi_21 = iztrans(zR_z(2,1), z, k);
Phi_22 = iztrans(zR_z(2,2), z, k);

Phi_k = [Phi_11, Phi_12; Phi_21, Phi_22];

% k=9
Phi_k_at_9 = subs(Phi_k, k, 9);
Phi_k_at_9_num = double(Phi_k_at_9);

disp('State transition matrix Phi(9):');
disp(Phi_k_at_9_num);
