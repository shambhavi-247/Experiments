clc;
close all;
clear all;
% Signal generation
x=0:.5:4*pi; % signal taken up to 4pi
sig1=8*sin(x); % generate 1st sinusoidal signal
l=length(sig1);
sig2=8*triang(l); % Generate 2nd triangular Signal
% Display of Both Signal
subplot(7,1,1);
plot(sig1);
title('Sinusoidal Signal');
ylabel('Amplitude--->');
xlabel('Time--->');
subplot(7,1,2);
plot(sig2);
title('Triangular Signal');
ylabel('Amplitude--->');
xlabel('Time--->');
% Display of Both Sampled Signal
subplot(7,1,3);
stem(sig1);
title('Sampled Sinusoidal Signal');
ylabel('Amplitude--->');
xlabel('Time--->');
subplot(7,1,4);
stem(sig2);
title('Sampled Triangular Signal');
ylabel('Amplitude--->');
xlabel('Time--->');
subplot(7,1,5);
l1=length(sig1);
l2=length(sig2);
for i=1:l1
sig(1,i)=sig1(i); % Making Both row vector to a matrix
sig(2,i)=sig2(i);
end
% TDM of both quantize signal
tdmsig=reshape(sig,1,2*l1);
% Display of TDM Signal
stem(tdmsig);
title('TDM Signal');
ylabel('Amplitude--->');
xlabel('Time--->');
% Demultiplexing of TDM Signal
demux=reshape(tdmsig,2,l1);
for i=1:l1
sig3(i)=demux(1,i); % Converting The matrix into row vectors
sig4(i)=demux(2,i);
end
% display of demultiplexed signal
subplot(7,1,6)
plot(sig3);
title('Recovered Sinusoidal Signal');
ylabel('Amplitude--->');
xlabel('Time--->');
subplot(7,1,7)
plot(sig4);
title('Recovered Triangular Signal');
ylabel('Amplitude--->');
xlabel('Time--->');