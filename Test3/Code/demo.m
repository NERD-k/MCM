N = 1:365;
y = (23 + 27/60).*sin((2*pi/365).*(N+284));
plot(N,y)
hold on
grid on