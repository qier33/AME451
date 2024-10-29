clc;
clear;

syms k R t;

A = [-(1+k^2)/R k;0 -(2+k^2)/R];
B = [0;1];
C = [1 0];

[V,D] = eig(A);
STM = simplify(V*expm(D*t)*inv(V));

eqn = STM(1, 2)

clc;
clear;

syms k R t;

A = [-(1+k^2)/R k; 0 -(2+k^2)/R];
B = [0; 1];
C = [1 0];

[V, D] = eig(A);
STM = simplify(V * expm(D * t) * inv(V));

eqn = STM(1, 2);

% Compute partial derivatives of eqn with respect to k and t
d_k = simplify(diff(eqn, k))
d_t = simplify(diff(eqn, t))