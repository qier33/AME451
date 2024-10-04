%% Models
m = 1;
k = 1;

initial_conditions = [
    0.1, 0.1;
    0.1, 0.5;
    0.5, 0.1;
    0.5, 0.5
];

hd_spring = @(t, x) [x(2); -k/m * (1 + x(1)^2) * x(1)];
sf_spring = @(t, x) [x(2); -k/m * (1 - x(1)^2) * x(1)];
li_spring = @(t, x) [x(2); -k/m * x(1)];

%% plot
figure;
tspan = [0, 20];

for i = 1:4
    subplot(2, 2, i);
    hold on;
    
    % hd
    [t, x_hard] = ode45(hd_spring, tspan, initial_conditions(i, :));
    plot(x_hard(:, 1), x_hard(:, 2), 'r', 'DisplayName', 'Hardening Spring');
    
    % sf
    [t, x_soft] = ode45(sf_spring, tspan, initial_conditions(i, :));
    plot(x_soft(:, 1), x_soft(:, 2), 'g', 'DisplayName', 'Softening Spring');
    
    % li
    [t, x_linear] = ode45(li_spring, tspan, initial_conditions(i, :));
    plot(x_linear(:, 1), x_linear(:, 2), 'b', 'DisplayName', 'Linear Spring');
    
    xlabel('Position $y(t)$', 'Interpreter', 'latex');
    ylabel('Velocity $\dot{y}(t)$', 'Interpreter', 'latex');
    title(sprintf('Initial Condition %d: y(0) = %.2f, $\\dot{y}(0)$ = %.2f', i, initial_conditions(i, 1), initial_conditions(i, 2)), 'Interpreter', 'latex');
    legend;
    
    axis equal;
    hold off;
end
