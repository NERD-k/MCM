clc, clear all

% ��ȡ�ļ�
% ��Ҫ�޸ģ���origin.xlsx�ļ�·�����룬���߷��ڴ�m�ļ���ͬĿ¼�£�ʹ��xlsread('origin.xlsx')
data = xlsread('D:\Mcm\Test1\�������³�.xlsx');

% �ϳ��³������ֱ�洢�ھ��� up �� down ��
for i = 1:2:36
    up((i+1)/2,:) = data(i,:);
end
for i = 2:2:36
    down(i/2,:) = data(i,:);
end

% ÿվ�ϳ��������³�����֮��
A = up - down;
% A��Ԫ���ۺ�
B = cumsum(A');
B = B';

% ÿ��ʱ��ε��ܾ���������
C = B(:,13);            % ����

% �����ؿ���
D = cumsum(C);


% �ļ�д��
% ��Ҫ�޸ģ���***.xlsx�ļ�·�����룬���߷��ڴ�m�ļ���ͬĿ¼�£�ʹ��xlswrite('***.xlsx')
%delete('D:\Mcm\Test1\�����ؿ���.xlsx')  % ����д��

%xlswrite('D:\Mcm\Test1\�����ؿ���.xlsx', D, '����');
