%% �ϳ��³������ֱ�洢�ھ��� up �� down ��
function [up,down] = up_down(data)
for i = 1:2:36
    up((i+1)/2,:) = data(i,:);
end
for i = 2:2:36
    down(i/2,:) = data(i,:);
end
end
%%

% ����������
up_down(up_data);
temp = up - down;
upS = cumsum(temp');
upS = upS';

% ����������
up_down(down_data);
temp = up - down;
downS = cumsum(temp');
downS = downS';

% �ļ�д��
% ��Ҫ�޸ģ���***.xlsx�ļ�·�����룬���߷��ڴ�m�ļ���ͬĿ¼�£�ʹ��xlswrite('***.xlsx')
% delete('D:\Mcm\Test1\data_deal.xlsx')  % ����д��
xlswrite('D:\Mcm\Test1\�����ؿ���.xlsx', upS, '����');
xlswrite('D:\Mcm\Test1\�����ؿ���.xlsx', downS, '����');
