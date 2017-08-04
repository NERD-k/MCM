clc, clear all

% 读取文件
% 如要修改，将origin.xlsx文件路径填入，或者放在此m文件相同目录下，使用xlsread('origin.xlsx')
data1 = xlsread('D:\Mcm\Test1\上行各站距离.xlsx');
data2 = xlsread('D:\Mcm\Test1\下行各站距离.xlsx');

ps1 = data / (20/60);
ps2 = data / (20/60);

save()