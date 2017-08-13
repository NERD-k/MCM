%   求影长
clc,clear

%% 输入参数
H = 3;
latitude = 39+54./60+26+(60.*60);
longitude = 116+23./60+29/(60.*60);
month = 10;
day = 22;
start_time = 9.0;
end_time = 15.0;

%% 求解影长
h = angle(latitude,longitude,month,day,start_time,end_time);  % latitude纬度  longitude经度
L = H ./ tan(h);

%% 寻找最短影长和时间
shortL = 10;
for j = 1:length(L)
    shortL = min(shortL,L(j));
    if min(shortL,L(j)) == L(j)
        time_shortL = j;
    end
end
hour_time_shortL = 9 + floor(time_shortL / 10000);
minute_time_shortL = 60*(time_shortL - floor(time_shortL / 10000)*10000)/10000;

%% 画图
figure
plot(start_time:0.0001:end_time,L,'b-');
hold on;
title('3米高的直杆的太阳影子长度的变化曲线');
xlabel('时刻');
ylabel('直杆的太阳影子长度');
j = 9 + time_shortL/10000 * ones(1,121);
line = 4:0.01:5.2;
plot(j,line,'r-');
hold on;
legend('影子长度的变化曲线','最短影子时间点：12:14:44');
