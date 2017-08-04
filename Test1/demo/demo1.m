`clc, clear all


% 读取文件
data1 = xlsread('D:\Mcm\Test1\上行各站距离.xlsx');
data2 = xlsread('D:\Mcm\Test1\下行各站距离.xlsx');

t1 = data1 ./ (20 ./ 60)
t2 = data2 ./ (20 ./ 60)

T1 = sum(t1)
T2 = sum(t2)