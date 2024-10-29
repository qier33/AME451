clc;
clear;

% 定义符号变量
syms sigma omega a b c d s;

% 定义矩阵 A 和其特征向量矩阵 D
A = sym([0 1; -(sigma^2 + omega^2) 2*sigma])

% 定义目标矩阵 A_bar 和变换矩阵 T
A_bar = sym([sigma omega; -omega sigma])
T = [a b; c d]

% 计算方程组 A * T - T * A_bar
eqn = simplify(T * A_bar - A * T)

% 将 eqn 的元素展平为一个向量
eqn_vector = [eqn(1,1); eqn(1,2); eqn(2,1); eqn(2,2)]

% 转换成矩阵形式，并计算零空间
[A_mat, b_vec] = equationsToMatrix(eqn_vector, [a b c d])
null_space_solution = null(A_mat);

% 显示零空间解
null_space_solution

%% test
T = [sigma, -omega;(sigma^2+omega^2),0]
simplify(inv(T)*A*T)ftftfttftftftftftfftftftttt