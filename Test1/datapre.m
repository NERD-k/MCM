clc, clear all

% ��ȡ�ļ�
% ��Ҫ�޸ģ���origin.xlsx�ļ�·�����룬���߷��ڴ�m�ļ���ͬĿ¼�£�ʹ��xlsread('origin.xlsx')
data = xlsread('D:\Mcm\Test1\�������³�.xlsx');
%data = xlsread('D:\Mcm\Test1\�������³�.xlsx');

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

% ����ʱ��ε�������
temp = A;
%temp = cat(1,zeros(1,13),A);    % ����
%temp(14,:) = [];                % ����
% temp = cat(1,zeros(1,14),A);    % ����
% temp(15,:) = [];                % ����
C = A - temp;

% ÿ��ʱ��ε��ܾ���������
%D = B(:,13);            % ����
 D = B(:,14);            % ����

% �����ؿ���
E = cumsum(D);


% �ļ�д��
% ��Ҫ�޸ģ���***.xlsx�ļ�·�����룬���߷��ڴ�m�ļ���ͬĿ¼�£�ʹ��xlswrite('***.xlsx')
%delete('D:\Mcm\Test1\�����ؿ���.xlsx')  % ����д��
%xlswrite('D:\Mcm\Test1\�����ؿ���.xlsx', E, '����');
%xlswrite('D:\Mcm\Test1\�����ؿ���.xlsx', E, '����');
