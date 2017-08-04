clc,clear

% 上下行的每一个站的车程
up_D = xlsread('D:\Mcm\Test1\上行各站距离.xlsx');
down_D = xlsread('D:\Mcm\Test1\下行各站距离.xlsx');

up_time = up_D / (20 / 60);     % 单位是 /h
up_time = cat(2,0,up_time);

down_time = down_D / (20 / 60);     % 单位是 /h
down_time = cat(2,0,down_time);


% xlswrite('D:\Mcm\Test1\上下行车程时间表.xlsx', up_time, '上行车程时间表');
% xlswrite('D:\Mcm\Test1\上下行车程时间表.xlsx', down_time, '下行车程时间表');
