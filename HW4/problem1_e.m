clc;
clear;
close all;

% MATLAB code for plotting x1(t) with different initial conditions in subplots and saving the figure

% Define time range
t = linspace(0, 50, 500);

% Parameters
k = 1;
R1 = 1;
R2 = 100;

% Define the matrix A for each R
A_R1 = [-(1 + k^2)/R1, k; 0, -(2 + k^2)/R1];
A_R2 = [-(1 + k^2)/R2, k; 0, -(2 + k^2)/R2];

% Different initial conditions (IC)
ICs = [
    1, 0;
    0, 1;
    1, 1;
    2, -1
];

% Number of initial conditions
num_ICs = size(ICs, 1);

% Create figure with subplots
figure;

for idx = 1:num_ICs
    % Extract current initial condition
    x0 = ICs(idx, :)';
    
    % Preallocate x1 arrays
    x1_R1 = zeros(size(t));
    x1_R2 = zeros(size(t));
    
    % Calculate x1(t) for each time step and each R
    for i = 1:length(t)
        x_R1 = expm(A_R1 * t(i)) * x0;
        x_R2 = expm(A_R2 * t(i)) * x0;
        x1_R1(i) = x_R1(1);
        x1_R2(i) = x_R2(1);
    end
    
    % Plotting in subplots
    subplot(2, 2, idx);
    plot(t, x1_R1, 'b-', 'LineWidth', 2);
    hold on;
    plot(t, x1_R2, 'r--', 'LineWidth', 2);
    xlabel('Time (t)');
    ylabel('x1(t)');
    title(sprintf('IC: x1(0) = %.1f, x2(0) = %.1f', x0(1), x0(2)));
    legend('R = 1', 'R = 100');
    grid on;
end

% Adjust the overall figure for clarity
sgtitle('Plots of x1(t) for Different Initial Conditions and R values');

% Save the figure as a PNG file
saveas(gcf, 'x1_plots_different_ICs.png');