clc, clear all


% ��ȡ�ļ�
% ��Ҫ�޸ģ���***.xlsx�ļ�·�����룬���߷��ڴ�m�ļ���ͬĿ¼�£�ʹ��xlsread('***.xlsx')
data1 = xlsread('D:\Mcm\Test1\�������³�.xlsx');
data2 = xlsread('D:\Mcm\Test1\�������³�.xlsx');

% ����Ϊ1,����Ϊ2
% �ϳ��³������ֱ�洢�ھ��� up �� down ��
for i = 1:2:36
    up1((i+1)/2,:) = data1(i,:);
end
for i = 2:2:36
    down1(i/2,:) = data1(i,:);
end

for i = 1:2:36
    up2((i+1)/2,:) = data2(i,:);
end
for i = 2:2:36
    down2(i/2,:) = data2(i,:);
end

% ÿվ�ϳ��������³�����֮��
A1 = up1 - down1;
A2 = up2 - down2;

B1 = max(A1');
B2 = max(A2');

% ÿ��ʱ�����Ҫ�ĳ���������
m1 = B1 ./ 120;
m2 = B2 ./ 120;

% ��������С�����ִ���
m1 = floor(m1 + 1);
m2 = floor(m2 + 1);
% ���ٷ�6����
m1(find(m1 < 5)) = 6;
m2(find(m2 < 5)) = 6;

save('m1','m1');
save('m2','m2');
% Ѱ��һ����Ҫ�����ٳ�����
max(m1)
max(m2)
%save( 'upHt.met','E');
%save( 'downHt.met','E');

% ÿ��ʱ��ķ���ʱ����
Dt1 = 60 ./ m1;
Dt2 = 60 ./ m2;

% ����
save('Dt1','Dt1');
save('Dt2','Dt2');
