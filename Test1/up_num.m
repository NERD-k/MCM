clc, clear all

% 读取文件
% 如要修改，将origin.xlsx文件路径填入，或者放在此m文件相同目录下，使用xlsread('origin.xlsx')
data = xlsread('D:\Mcm\Test1\上行上下车.xlsx');

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

m = zeros(18,1);
for i = 1:18
    for j = 1:14
        m(i,1) = max(m(i,1),B(i,j));
    end
end

aver = sum(m) / 18;
%aver = sum(sum(B)) / (18*14);

figure
bar(m);
hold on;

xrange = get(gca,'xlim');
for i = 1:18
text(i-0.5,m(i)+400,num2str(m(i)));
end

plot(xrange,[aver aver],'r-');
set(gca,'xtick',0.5:18.5);
set(gca,'xticklabel',{'5','6','7','8','9','10','11','12',...
    '13','14','15','16','17','18','19','20','21','22','23'});
title('上行各个时间段公交车的最大载客量');
xlabel('时刻（点）');
ylabel('最大载客量');

%xlswrite('D:\Mcm\Test1\每个时段载客量.xlsx', D, '上行');