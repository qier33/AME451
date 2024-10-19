clc;
clear;

A1 = [1 1 0; 0 1 0; 0 0 1];
A2 = [1 1 0; 0 0 1; 0 0 1];
A3 = [2 0 0 0; 2 2 0 0; 0 0 3 3; 0 0 0 3];

syms t real;

try
    A1_power_t = mpower(A1, t);
    disp('A1^t:');
    disp(A1_power_t);
catch ME
    disp('Error with A1^t:');
    disp(ME.message);
end

try
    A2_power_t = mpower(A2, t);
    disp('A2^t:');
    disp(A2_power_t);
catch ME
    disp('Error with A2^t:');
    disp(ME.message);
end

try
    A3_power_t = mpower(A3, t);
    disp('A3^t:');
    disp(A3_power_t);
catch ME
    disp('Error with A3^t:');
    disp(ME.message);
end

% 计算 e^(A*t)
disp('e^(A1 * t) =');
eAt1 = expm(A1 * t);
disp(eAt1);

disp('e^(A2 * t) =');
eAt2 = expm(A2 * t);
disp(eAt2);

disp('e^(A3 * t) =');
eAt3 = expm(A3 * t);
disp(eAt3);