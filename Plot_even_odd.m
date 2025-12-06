n=-5:5;
yn= 0*(n<0)+1*(n==0)+1*(n>0);
yflip=fliplr(yn);
subplot(3,1,1);
stem(n,yn,'r');
title('plot of yn');
xlabel('time');
ylabel('yn');

ye = (1/2)*(yn+yflip);
subplot(3,1,2);
stem(n,ye,'b');
title('plot of even');
xlabel('time');
ylabel('y even');

yo= (1/2)*(yn-yflip);
subplot(3,1,3);
stem(n,yo);
title('plot of odd');
xlabel('time');
ylabel('y odd');