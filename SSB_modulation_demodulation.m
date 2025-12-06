% AIM: To generate SSBSC wave Modulation using MATLAB Software.

% Parameters
fs = 8000;              % Sampling frequency
fm = 20;                % Message frequency
fc = 50;                % Carrier frequency
Am = 1;                 % Message amplitude
Ac = 1;                 % Carrier amplitude
t = 0:1/fs:0.1;       % Time vector for 0.1 second duration

% Message Signal (cosine and sine components)
m1 = Am * cos(2*pi*fm*t);  
m2 = Am * sin(2*pi*fm*t);

% Carrier Signal (cosine and sine components)
c1 = Ac * cos(2*pi*fc*t);
c2 = Ac * sin(2*pi*fc*t);

% Plot Message Signal
subplot(5,1,1);
plot(t, m1);
title('Message Signal (cos)');

% Plot Carrier Signal
subplot(5,1,2);
plot(t, c1);
title('Carrier Signal (cos)');

% SSB-SC with Upper Sideband (USB)
Susb = 0.5*m1.*c1 - 0.5*m2.*c2;
subplot(5,1,3);
plot(t, Susb);
title('SSB-SC Signal with USB');

% SSB-SC with Lower Sideband (LSB)
Slsb = 0.5*m1.*c1 + 0.5*m2.*c2;
subplot(5,1,4);
plot(t, Slsb);
title('SSB-SC Signal with LSB');

% Demodulation (Coherent Detection of USB)
r = Susb .* c1;

% Low-pass filter design to retrieve message
[b, a] = butter(5, (fm/fs)*2);   % Normalized cutoff frequency
mr = filter(b, a, r);

% Plot demodulated signal
subplot(5,1,5);
plot(t, mr);
title('Demodulated Message from USB');
