clc;
clear;
syms k t

% 定义数值变量 R
R = 1;

% 定义方程
eqn = exp(-t/R) - (R/(2*t)) + 1/(R/(2*t) + 2) == 0;

% 求解方程 t 的正数解
solutions = vpasolve(eqn, t, [0, inf])