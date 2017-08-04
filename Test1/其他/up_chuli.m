clc, clear all

% 读取文件
load upline
data = upline;

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
B = sum(A');
C = cumsum(B)

