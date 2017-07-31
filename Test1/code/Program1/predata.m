% 预处理

function [E,s] = predata()

data = importdata('data.mat');
ps = importdata('ps.mat');

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

s = sum(ps);
end
