clear;
clc;
close all;

% 使用 Symbolic Math Toolbox 定义符号变量
syms alpha

% 定义矩阵 A，其中 alpha 保持为符号形式
A = [-1, -2, 0;
     -2, -5, 0;
      alpha, 2*alpha, -1];

% 计算矩阵 A 的特征值和右特征向量
[V, D] = eig(A);

% 调整第二列和第三列，使它们的第一个元素为1
V(:,2) = V(:,2) / V(1,2); % 将第二列的第一个元素设为1
V(:,3) = V(:,3) / V(1,3); % 将第三列的第一个元素设为1

% 对右特征向量矩阵 V 进行化简
V = simplify(V);

% 显示调整并化简后的右特征向量矩阵
disp('调整并化简后的右特征向量矩阵 V：');
disp(V);

% 显示特征值
disp('矩阵 A 的特征值：');
disp(diag(D));

% 计算矩阵 A^T 的特征值和左特征向量
[V_left, D_left] = eig(A');

% 对左特征向量矩阵 V_left 进行化简

V_left(:,2) = V_left(:,2) / (2*2^(1/2));  % 归一化
V_left(:,3) = V_left(:,3) / -(2*2^(1/2));

V_left = simplify(V_left);

% 显示调整并化简后的左特征向量矩阵
disp('调整并化简后的左特征向量矩阵 V_left：');
disp(V_left);

% 验证双正交性，即左特征向量和右特征向量的内积是否为 Kronecker delta
% V_left' * V 是否是单位矩阵
orthogonality_check = simplify(V_left' * V);
disp('验证双正交条件 (V_left'' * V)：');
disp(orthogonality_check);
