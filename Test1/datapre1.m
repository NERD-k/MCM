%% 上车下车人数分别存储在矩阵 up 和 down 中
function [up,down] = up_down(data)
for i = 1:2:36
    up((i+1)/2,:) = data(i,:);
end
for i = 2:2:36
    down(i/2,:) = data(i,:);
end
end
%%

% 处理上行线
up_down(up_data);
temp = up - down;
upS = cumsum(temp');
upS = upS';

% 处理下行线
up_down(down_data);
temp = up - down;
downS = cumsum(temp');
downS = downS';

% 文件写入
% 如要修改，将***.xlsx文件路径填入，或者放在此m文件相同目录下，使用xlswrite('***.xlsx')
% delete('D:\Mcm\Test1\data_deal.xlsx')  % 覆盖写入
xlswrite('D:\Mcm\Test1\整点载客量.xlsx', upS, '上行');
xlswrite('D:\Mcm\Test1\整点载客量.xlsx', downS, '下行');
