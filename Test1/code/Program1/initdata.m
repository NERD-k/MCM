% Ԥ������ȡ�ļ�
function [data,ps] = initdata()

% ��ȡ�ļ�
% ��Ҫ�޸ģ���origin.xlsx�ļ�·�����룬���߷��ڴ�m�ļ���ͬĿ¼�£�ʹ��xlsread('origin.xlsx')
data = xlsread('D:\Mcm\Test1\origin.xlsx');
ps = xlsread('D:\Mcm\Test1\distance.xlsx');

save('data','data');
save('ps','ps');
end
