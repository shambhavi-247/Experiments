clc; clear; close all;

% Define discrete time range
n = -10:10;

% Define a discrete signal (Example: Unit step sequence)
x = [zeros(1,10), 1, ones(1,10)];

% Compute even and odd components
x_even = (x + fliplr(x)) / 2;
x_odd = (x - fliplr(x)) / 2;

% Plot original discrete signal
figure;
subplot(3,1,1);
stem(n, x, 'b', 'LineWidth', 0.7);
grid on;
title('Original Discrete Signal');
xlabel('n'); ylabel('Amplitude');

% Plot even component
subplot(3,1,2);
stem(n, x_even, 'r', 'LineWidth', 1.5);
grid on;
title('Even Component of Discrete Signal');
xlabel('n'); ylabel('Amplitude');

% Plot odd component
subplot(3,1,3);
stem(n, x_odd, 'g', 'LineWidth', 1.5);
grid on;
title('Odd Component of Discrete Signal');
xlabel('n'); ylabel('Amplitude');