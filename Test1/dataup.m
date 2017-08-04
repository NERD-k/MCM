clc, clear all

% 读取文件
% 如要修改，将origin.xlsx文件路径填入，或者放在此m文件相同目录下，使用xlsread('origin.xlsx')
data = xlsread('D:\Mcm\Test1\下行上下车.xlsx');

% 上车下车人数分别存储在矩阵 up 和 down 中
for i = 1:2:36
    up((i+1)/2,:) = data(i,:);
end
for i = 2:2:36
    down(i/2,:) = data(i,:);
end

% 每站上车人数与下车人数之差
A = up - down;
% A行元素累和
B = cumsum(A');
B = B';

% 每个时间段的总净增加人数
C = B(:,13);            % 下行

% 整点载客量
D = cumsum(C);


% 文件写入
% 如要修改，将***.xlsx文件路径填入，或者放在此m文件相同目录下，使用xlswrite('***.xlsx')
%delete('D:\Mcm\Test1\整点载客量.xlsx')  % 覆盖写入

%xlswrite('D:\Mcm\Test1\整点载客量.xlsx', D, '下行');
