clear;
clc;
close all;

% 定义参数
omega = 2;
alpha = 1;

% 定义系统矩阵 A(t)
A = @(t) [0, 1; -(omega - alpha * cos(2*t)), 0];

% 定义初始条件
x0 = [1; 0];  % 假设初始条件为 y(0) = 1, y_dot(0) = 0

% 时间范围，考虑较长的时间范围来观察周期性
tspan = [0 20*pi];  % 用较长的时间范围来检查周期性

% 使用 ode45 求解微分方程
[t, x] = ode45(@(t, x) A(t) * x, tspan, x0);

% 绘图显示结果，查看是否有周期性
figure;
subplot(2, 1, 1);
plot(t, x(:, 1), 'DisplayName', 'y(t)');
xlabel('Time t');
ylabel('y(t)');
title('Mathieu Equation Solution: y(t)');
grid on;

subplot(2, 1, 2);
plot(t, x(:, 2), 'DisplayName', 'dy/dt');
xlabel('Time t');
ylabel('dy/dt');
title('Mathieu Equation Solution: dy/dt');
grid on;

% 检查是否有周期性：比较解在不同时间点的值
y_initial = x(1, 1);  % 初始的 y 值
dy_initial = x(1, 2); % 初始的 dy/dt 值

% 设定一个小的容差来判断是否接近初始值
tolerance = 1e-3;

% 遍历找到接近初始条件的时间点，跳过 t = 0
for i = 2:length(t)  % 从第二个时间点开始
    if abs(x(i, 1) - y_initial) < tolerance && abs(x(i, 2) - dy_initial) < tolerance
        fprintf('解在 t = %.2f 处重复，周期可能为 %.2f\n', t(i), t(i));
        break;
    end
end
