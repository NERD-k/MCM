% Ԥ����

function [E,s] = predata()

data = importdata('data.mat');
ps = importdata('ps.mat');

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

s = sum(ps);
end
