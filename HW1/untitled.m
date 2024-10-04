% 清除所有数据、输出，并关闭所有图形
clear;
clc;
close all;

% 定义微分方程
dxdt = @(t, x) x * (x^2 - 1);

% 设置时间范围
tspan = [0 6]; % 模拟从 t=0 到 t=6

% 设置初始条件
initial_conditions = [-1, -0.8, -0.5, -0.1, 0, 0.1, 0.5, 0.8, 1]; 

% 创建图形窗口
figure;

% 循环遍历每个初始条件并绘制响应曲线
for i = 1:length(initial_conditions)
    x0 = initial_conditions(i);
    
    % 使用 ode45 进行数值积分
    [t, x] = ode45(dxdt, tspan, x0);
    
    % 创建子图，3x3 的子图布局
    subplot(3, 3, i); 
    plot(t, x, 'DisplayName', 'Nonlinear System');
    hold on;
    
    % 线性化在 x = -1 附近的解
    x_linear_minus_1 = -1 + (x0 + 1) * exp(2 * t);
    plot(t, x_linear_minus_1, '--', 'DisplayName', 'Linearized around x=-1');
    
    % 线性化在 x = 0 附近的解
    x_linear_0 = x0 * exp(-t);
    plot(t, x_linear_0, '-.', 'DisplayName', 'Linearized around x=0');
    
    % 线性化在 x = 1 附近的解
    x_linear_1 = 1 + (x0 - 1) * exp(2 * t);
    plot(t, x_linear_1, ':', 'DisplayName', 'Linearized around x=1');
    
    % 图形设置
    title(['x(0) = ', num2str(x0)]);
    xlabel('Time');
    ylabel('x(t)');
    ylim([-1.1, 1.1]); % 固定纵坐标范围
    legend;
    grid on;
    hold off;
end

% 全局标题
sgtitle({'响应曲线 $\dot{x} = x(x^2-1)$', 'with Linearization at $x = -1$, $x = 0$, and $x = 1$'}, 'Interpreter', 'latex');


