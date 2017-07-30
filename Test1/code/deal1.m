clc,clear
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
A = up - down
;
% 累积求和
B = cumsum(A');
B = B';

% 相邻时间段的人数差
temp = A;
temp = cat(1,zeros(1,14),A);
temp(15,:) = [];
C = A - temp;

% 每个时间段的总净人数
D = B(:,14);

% 文件写入
% 如要修改，将deal1.xlsx文件路径填入，或者放在此m文件相同目录下，使用xlswrite('deal1.xlsx')
% delete('D:\Mcm\Test1\deal1.xlsx')  % 覆盖写入
xlswrite('D:\Mcm\Test1\deal1.xlsx', A, '净人数')
xlswrite('D:\Mcm\Test1\deal1.xlsx', B', '净人数求和')
xlswrite('D:\Mcm\Test1\deal1.xlsx', C, '相邻时间段人数差')
xlswrite('D:\Mcm\Test1\deal1.xlsx', D, '每个时间段的总净人数')
