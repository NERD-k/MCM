clc,clear

% �����е�ÿһ��վ�ĳ���
up_D = xlsread('D:\Mcm\Test1\���и�վ����.xlsx');
down_D = xlsread('D:\Mcm\Test1\���и�վ����.xlsx');

up_time = up_D / (20 / 60);     % ��λ�� /h
up_time = cat(2,0,up_time);

down_time = down_D / (20 / 60);     % ��λ�� /h
down_time = cat(2,0,down_time);


% xlswrite('D:\Mcm\Test1\�����г���ʱ���.xlsx', up_time, '���г���ʱ���');
% xlswrite('D:\Mcm\Test1\�����г���ʱ���.xlsx', down_time, '���г���ʱ���');
