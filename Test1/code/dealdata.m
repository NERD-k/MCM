clc, clear all

%%  对数据的处理

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
F = cumsum(A);

% 每个时间段的总净增加人数
D = B(:,14);

% 每个时间段的人数
E = cumsum(D);


F = cumsum(A);

% 文件写入
% 如要修改，将data_deal.xlsx文件路径填入，或者放在此m文件相同目录下，使用xlswrite('data_deal.xlsx')
delete('D:\Mcm\Test1\data_deal.xlsx')  % 覆盖写入
xlswrite('D:\Mcm\Test1\data_deal.xlsx', A, 'A')
xlswrite('D:\Mcm\Test1\data_deal.xlsx', B, 'B')
xlswrite('D:\Mcm\Test1\data_deal.xlsx', C, 'C')
xlswrite('D:\Mcm\Test1\data_deal.xlsx', D, 'D')
xlswrite('D:\Mcm\Test1\data_deal.xlsx', E, 'E')
xlswrite('D:\Mcm\Test1\data_deal.xlsx', F, 'F')
