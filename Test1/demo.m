clc, clear all

% ��ȡ�ļ�
% ��Ҫ�޸ģ���***.xlsx�ļ�·�����룬���߷��ڴ�m�ļ���ͬĿ¼�£�ʹ��xlsread('***.xlsx')
data1 = xlsread('D:\Mcm\Test1\�������³�.xlsx');
data2 = xlsread('D:\Mcm\Test1\�������³�.xlsx');
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

U1 = 1:14;
D1 = 1:14;

for i = 1:18
    rho1U(i,:) = spline(U1,up1(i,:),1:(1/45):14);
    rho1D(i,:) = spline(D1,down1(i,:),1:(1/45):14);
end


U2 = 1:13;
D2 = 1:13;

for i = 1:18
    rho2U(i,:) = spline(U2,up2(i,:),1:(1/45):13);
    rho2D(i,:) = spline(D2,down2(i,:),1:(1/45):13);
end