clc;
clear all;
close all;

% Parameters
Fs = 1000;              % Sampling frequency for display
t = 0:1:60;             % Time vector for modulating signal

% Modulating signal (analog sine wave)
mod_signal = sin(2*pi*t/60);  % Low frequency sine wave

% Plot Modulating Signal
subplot(3,1,1);
plot(t, mod_signal, 'b');
title('Modulating Signal');
xlabel('time');
ylabel('Amplitude');
grid on;

% Modulated signal - Impulse sampled version
Ts = 1;                         % Sampling period (same as t step)
n = 0:1:60;                     % Sample times
sampled_signal = sin(2*pi*n/60);

subplot(3,1,2);
stem(n, sampled_signal, 'b', 'filled');
hold on;
plot(t, mod_signal, 'k--');     % Show original signal as reference
title('Modulated Signal');
xlabel('time');
ylabel('Amplitude');
grid on;

% Demodulated signal - Reconstructed with interpolation
% Use interpolation to recover the continuous-time signal
t_fine = 0:0.1:60;              % Finer time vector for smooth curve
demodulated = interp1(n, sampled_signal, t_fine, 'spline');

subplot(3,1,3);
plot(t_fine, demodulated, 'b');
title('Demodulated Signal');
xlabel('time');
ylabel('Amplitude');
grid on;
