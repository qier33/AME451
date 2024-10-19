clc;
clear;

% 定义微分方程的右端函数
f = @(t, x) [-x(1)^2 + x(1)*x(2); -2*x(2)^2 + x(2) - x(1)*x(2) + 2];

% 多组初始条件
initial_conditions = [
    1, 1;
    2, -1;
    -1, 2;
    0, 0.5;
    -0.5, -0.5
];

% 求解时间区间
tspan = [0 20]; % 从t = 0到t = 20

% 创建图形窗口
figure;
hold on;

% 逐个初始条件求解并绘图
for i = 1:size(initial_conditions, 1)
    x0 = initial_conditions(i, :)'; % 取第i组初始条件
    
    % 使用ode45求解微分方程
    [t, x] = ode45(f, tspan, x0);
    
    % 检查是否有解发散
    if max(abs(x(:,1))) > 1e3 || max(abs(x(:,2))) > 1e3
        disp(['初始条件 [' num2str(x0(1)) ', ' num2str(x0(2)) '] 导致发散']);
    else
        disp(['初始条件 [' num2str(x0(1)) ', ' num2str(x0(2)) '] 稳定']);
    end
    
    % 绘制x1(t)和x2(t)
    plot(t, x(:,1), 'DisplayName', sprintf('x_1(t) with x_0 = [%g, %g]', x0(1), x0(2)));
    plot(t, x(:,2), '--', 'DisplayName', sprintf('x_2(t) with x_0 = [%g, %g]', x0(1), x0(2)));
end

% 图形格式设置
xlabel('Time t');
ylabel('Solutions x_1 and x_2');
legend('show');
grid on;
title('Solution of Nonlinear ODE System with Different Initial Conditions');
hold off;
