clc,clear
% 问题二图像
x=[1.0365 1.0699 1.1038	1.1383 1.1732 1.2087 1.2448	1.2815 1.3189 1.3568 1.3955	1.4349 1.4751 1.516	1.5577 1.6003 1.6438 1.6882	1.7337 1.7801 1.8277];
y=[0.4973 0.5029 0.5085 0.5142 0.5198 0.5255 0.5311 0.5368 0.5426 0.5483 0.5541	0.5598 0.5657 0.5715 0.5774	0.5833 0.5892 0.5952 0.6013	0.6074 0.6135];
l=sqrt(x.^2+y.^2);
t=14.7:0.05:15.7;
A=polyfit(t,l,2);
z=polyval(A,t);

%% 画图
figure
plot(t,l,'r*',t,z,'b');
hold on;
title('直杆的太阳影子长度拟合的变化曲线');
xlabel('时刻');
ylabel('直杆的太阳影子长度');
set(gca,'xtick',14.7:0.1:15.7);
set(gca,'xticklabel',{'14:42','14:48','14:56','15:00','15:06','15:12',...
    '15:18','15:24','15:00','15:36','15:42'});
legend('实验数据','二次拟合')
A