clc,clear
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

% ÿ��ʱ��ε��ܾ���������
D = B(:,14);

% ÿ��ʱ��ε�����
E = cumsum(D);

% ��ֵ
E = cat(1,0,E);
time = linspace(1,19,19)';
x = 1:0.1:19;
y = interp1(time,E,x,'cubic');

figure
plot(x,y,'-');
title('����ʱ����ڳ��ϵ�������');
xlabel('ʱ��');
ylabel('������');

% �ļ�д��
% ��Ҫ�޸ģ���deal1.xlsx�ļ�·�����룬���߷��ڴ�m�ļ���ͬĿ¼�£�ʹ��xlswrite('deal1.xlsx')
% delete('D:\Mcm\Test1\deal1.xlsx')  % ����д��
xlswrite('D:\Mcm\Test1\deal1.xlsx', A, '������')
xlswrite('D:\Mcm\Test1\deal1.xlsx', B', '���������')
xlswrite('D:\Mcm\Test1\deal1.xlsx', C, '����ʱ���������')
xlswrite('D:\Mcm\Test1\deal1.xlsx', D, 'ÿ��ʱ��ε��ܾ�����')