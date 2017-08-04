clc, clear all


% 读取文件
% 如要修改，将***.xlsx文件路径填入，或者放在此m文件相同目录下，使用xlsread('***.xlsx')
data1 = xlsread('D:\Mcm\Test1\上行上下车.xlsx');
data2 = xlsread('D:\Mcm\Test1\下行上下车.xlsx');

% 上行为1,下行为2
% 上车下车人数分别存储在矩阵 up 和 down 中
for i = 1:2:36
    up1((i+1)/2,:) = data1(i,:);
end
for i = 2:2:36
    down1(i/2,:) = data1(i,:);
end

for i = 1:2:36
    up2((i+1)/2,:) = data2(i,:);
end
for i = 2:2:36
    down2(i/2,:) = data2(i,:);
end

% 每站上车人数与下车人数之差
A1 = up1 - down1;
A2 = up2 - down2;

B1 = max(A1');
B2 = max(A2');

% 每个时间段需要的车辆数下限
m1 = B1 ./ 120;
m2 = B2 ./ 120;

% 车辆数有小数部分处理
m1 = floor(m1 + 1);
m2 = floor(m2 + 1);
% 至少发6辆车
m1(find(m1 < 5)) = 6;
m2(find(m2 < 5)) = 6;

save('m1','m1');
save('m2','m2');
% 寻找一天所要的最少车辆数
max(m1)
max(m2)
%save( 'upHt.met','E');
%save( 'downHt.met','E');

% 每段时间的发车时间间隔
Dt1 = 60 ./ m1;
Dt2 = 60 ./ m2;

% 保存
save('Dt1','Dt1');
save('Dt2','Dt2');
