% 预处理，读取文件
function [data,ps] = initdata()

% 读取文件
% 如要修改，将origin.xlsx文件路径填入，或者放在此m文件相同目录下，使用xlsread('origin.xlsx')
data = xlsread('D:\Mcm\Test1\上行上下车.xlsx');
ps = xlsread('D:\Mcm\Test1\上行各站距离.xlsx');

save('data','data');
save('ps','ps');
end
