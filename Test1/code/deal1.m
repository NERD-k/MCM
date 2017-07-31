clc, clear all

% 读取文件
% 如要修改，将origin.xlsx文件路径填入，或者放在此m文件相同目录下，使用xlsread('origin.xlsx')
data = xlsread('D:\Mcm\Test1\origin.xlsx');

% 上车下车人数分别存储在矩阵 up 和 down 中
for i = 1:2:36
    up((i+1)/2,:) = data(i,:);
end
for i = 2:2:36
    down(i/2,:) = data(i,:);
end

% 每站上车人数与下车人数之差
A = up - down;
% 累积求和
B = cumsum(A');
B = B';

% 相邻时间段的人数差
temp = A;
temp = cat(1,zeros(1,14),A);
temp(15,:) = [];
C = A - temp;

% 每个时间段的总净增加人数
D = B(:,14);

% 每个时间段的人数
E = cumsum(D);

m = zeros(18,1);
% 最大载客量
for i = 1:18
    for j = 1:14
        m(i,1) = max(B(i,j),m(i,1));
    end
end

% 柱状图
figure
bar(m);
set(gca,'xtick',0.5:18.5);
set(gca,'xticklabel',{'5','6','7','8','9','10','11','12',...
    '13','14','15','16','17','18','19','20','21','22','23'});
title('各个时间段公交车的最大载客量');
xlabel('时刻（点）');
ylabel('总人数');


% 插值
% E = cat(1,0,E);
% time = linspace(1,19,19)';
% x = 1:0.1:19;
% y = interp1(time,E,x,'cubic');

% 曲线图
% figure
% plot(x,y,'-');
% set(gca,'xtick',time);
% set(gca,'xticklabel',{'5','6','7','8','9','10','11','12',...
    % '13','14','15','16','17','18','19','20','21','22','23'});
% title('各个时间段在车上的总人数（三次插值）');
% xlabel('时刻（点）');
% ylabel('总人数');


% 文件写入
% 如要修改，将deal1.xlsx文件路径填入，或者放在此m文件相同目录下，使用xlswrite('deal1.xlsx')
% delete('D:\Mcm\Test1\deal1.xlsx')  % 覆盖写入
% xlswrite('D:\Mcm\Test1\deal1.xlsx', A, '净人数')
% xlswrite('D:\Mcm\Test1\deal1.xlsx', B', '净人数求和')
% xlswrite('D:\Mcm\Test1\deal1.xlsx', C, '相邻时间段人数差')
% xlswrite('D:\Mcm\Test1\deal1.xlsx', D, '每个时间段的总净人数')
