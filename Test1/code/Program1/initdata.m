% Ԥ������ȡ�ļ�
function [data,ps] = initdata()

% ��ȡ�ļ�
% ��Ҫ�޸ģ���origin.xlsx�ļ�·�����룬���߷��ڴ�m�ļ���ͬĿ¼�£�ʹ��xlsread('origin.xlsx')
data = xlsread('D:\Mcm\Test1\�������³�.xlsx');
ps = xlsread('D:\Mcm\Test1\���и�վ����.xlsx');

save('data','data');
save('ps','ps');
end
