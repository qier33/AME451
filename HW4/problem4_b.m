clc;
clear;

syms sigma omega a b c d s;

% Define the matrix A symbolically
A = sym([0 1; -(sigma^2 + omega^2) 2*sigma]);
B = [0;1];
C = [1 0];
R = inv(s * eye(2) - A);
H = simplify(C * R * B);

% Define transformation matrix T and transformed system matrices
T = sym([a b; c d]);
A_bar = sym([sigma omega; -omega sigma]);
B_bar = inv(T) * B;
C_bar = C * T;
R_bar = inv(s * eye(2) - A_bar);
H_bar = simplify(C_bar * R_bar * B_bar);

% Set up the equation
eqn = H - H_bar;

% Solve for a, b, c, and d
solution = solve(eqn, [a b c d]);

% Loop through all 4 solutions and display T and the transformed A matrix
for i = 1:length(solution.a)
    disp(['Solution set ', num2str(i), ':']);
    
    % Construct the transformation matrix for the i-th solution
    T_sol = [solution.a(i) solution.b(i); solution.c(i) solution.d(i)];
    disp('Transformation matrix T:');
    disp(T_sol);
    
    % Calculate and simplify the transformed A matrix
    A_bar_sol = simplify(inv(T_sol) * A * T_sol);
    disp('Transformed A matrix A_bar:');
    disp(A_bar_sol);
    disp('---------------------------------------------');
end