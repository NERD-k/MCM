clc, clear all

% ��ȡ�ļ�
load upline
data = upline;

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
B = sum(A');
C = cumsum(B)

