`clc, clear all


% ��ȡ�ļ�
data1 = xlsread('D:\Mcm\Test1\���и�վ����.xlsx');
data2 = xlsread('D:\Mcm\Test1\���и�վ����.xlsx');

t1 = data1 ./ (20 ./ 60)
t2 = data2 ./ (20 ./ 60)

T1 = sum(t1)
T2 = sum(t2)