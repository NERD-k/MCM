clc, clear all

%%  �����ݵĴ���

% ��ȡ�ļ�
% ��Ҫ�޸ģ���origin.xlsx�ļ�·�����룬���߷��ڴ�m�ļ���ͬĿ¼�£�ʹ��xlsread('origin.xlsx')
data = xlsread('D:\Mcm\Test1\origin.xlsx');

% �ϳ��³������ֱ�洢�ھ��� up �� down ��
for i = 1:2:36
    up((i+1)/2,:) = data(i,:);
end
for i = 2:2:36
    down(i/2,:) = data(i,:);
end

% ÿվ�ϳ��������³�����֮��
A = up - down;
% �ۻ����
B = cumsum(A');
B = B';


% ����ʱ��ε�������
temp = A;
temp = cat(1,zeros(1,14),A);
temp(15,:) = [];
C = A - temp;
F = cumsum(A);

% ÿ��ʱ��ε��ܾ���������
D = B(:,14);

% ÿ��ʱ��ε�����
E = cumsum(D);


F = cumsum(A);

% �ļ�д��
% ��Ҫ�޸ģ���data_deal.xlsx�ļ�·�����룬���߷��ڴ�m�ļ���ͬĿ¼�£�ʹ��xlswrite('data_deal.xlsx')
delete('D:\Mcm\Test1\data_deal.xlsx')  % ����д��
xlswrite('D:\Mcm\Test1\data_deal.xlsx', A, 'A')
xlswrite('D:\Mcm\Test1\data_deal.xlsx', B, 'B')
xlswrite('D:\Mcm\Test1\data_deal.xlsx', C, 'C')
xlswrite('D:\Mcm\Test1\data_deal.xlsx', D, 'D')
xlswrite('D:\Mcm\Test1\data_deal.xlsx', E, 'E')
xlswrite('D:\Mcm\Test1\data_deal.xlsx', F, 'F')
