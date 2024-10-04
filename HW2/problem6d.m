clear;
clc;
close all;

%% eigenvalues eigenvectors
syms alpha t

% A
A = [-1, -2, 0;
     -2, -5, 0;
      alpha, 2*alpha, -1];

% right vectors
[W, D] = eig(A);
W(:,2) = W(:,2) / W(1,2);
W(:,3) = W(:,3) / W(1,3);
W = simplify(W);

% left vectors
[V, D_left] = eig(A');
V(:,2) = V(:,2) / (2*2^(1/2));
V(:,3) = V(:,3) / -(2*2^(1/2));
V = simplify(V);

%% Phi 
third_row = W(3, :);
Phi_last_row = third_row * expm(D * t) * V';

%% Output
% initial condition
x0 = [1; 0; 0]; 

t_vals = linspace(0, 10, 1000);
alpha_values = [0.001, 0.01, 0.1, 0.5, 1, 2, 5];  
colors = {'r', 'g', 'b', 'm', 'c', 'y', 'k'};

figure;
for i = 1:length(alpha_values)
    alpha_val = alpha_values(i);
    
    % y
    y_t = Phi_last_row * x0;
    y_numeric = subs(y_t, {alpha, t}, {alpha_val, t_vals});
    y_numeric = double(y_numeric);
    plot(t_vals, y_numeric, 'Color', colors{i}, 'DisplayName', ['\alpha = ', num2str(alpha_val)]);
    hold on;
end

xlabel('Time (s)');
ylabel('Output y(t)');
title('System Output for Different \alpha Values');
legend('show');
grid on;
hold off;
