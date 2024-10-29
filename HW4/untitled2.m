% 清空工作区并定义符号变量
clc;
clear;
syms k R t

% 定义方程
R = 1;
eqn1 = R - 2 * k^2 * t;
eqn2 = (k^2+2) * exp(-2*t/R) - (k^2+1)*exp(-t/R);

% 限制 k 和 t 为正数并求数值解
solutions = vpasolve([eqn1 == 0, eqn2 == 0], [k, t], [0 Inf; 0 Inf])