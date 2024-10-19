clc;
clear;

syms x1 x2 f1 f2 real
syms s

% 定义非线性方程
f1 = - x2 / (1 + x1 ^ 2) - 2 * x1;
f2 = x1 / (1 + x1 ^ 2);

% 定义状态变量
x = [x1; x2];
f = [f1; f2];

% 计算雅可比矩阵
A = jacobian(f, x)

% 平衡点
x_eq = [0; 0];

% 将平衡点代入雅可比矩阵
A = subs(A, {x1, x2}, {x_eq(1), x_eq(2)})

Q = [2, 0; 0, 2];

P = lyap(A',Q)

A' * P + P * A + Q

simplify(x' * P * x)