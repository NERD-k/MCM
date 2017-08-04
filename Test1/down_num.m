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

m = zeros(18,1);
for i = 1:18
    for j = 1:13
        m(i,1) = max(m(i,1),B(i,j));
    end
end

%aver = sum(m) / 18;
aver = sum(sum(B)) / (18*13);

figure
bar(m);
hold on;
% ����ͼ����ֵ
xrange = get(gca,'xlim');
for i = 1:18
text(i-0.5,m(i)+200,num2str(m(i)));
end
% ����
plot(xrange,[aver aver],'r-');
set(gca,'xtick',0.5:18.5);
set(gca,'xticklabel',{'5','6','7','8','9','10','11','12',...
    '13','14','15','16','17','18','19','20','21','22','23'});
title('���и���ʱ��ι�����������ؿ���');
xlabel('ʱ�̣��㣩');
ylabel('����ؿ���');

%xlswrite('D:\Mcm\Test1\ÿ��ʱ���ؿ���.xlsx', D, '����');
