clc, clear all


% ��ȡ�ļ�
% ��Ҫ�޸ģ���***.xlsx�ļ�·�����룬���߷��ڴ�m�ļ���ͬĿ¼�£�ʹ��xlsread('***.xlsx')
%data = xlsread('D:\Mcm\Test1\�������³�.xlsx');
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
% �ۻ����
B = cumsum(A');
B = B';


% ÿ��ʱ��ε��ܾ���������
D = B(:,13);

% ÿ��ʱ��εľ�����
E = cumsum(D);

% ÿ��ʱ�����Ҫ�ĳ���������
m = E / 120;

% Ѱ��һ����Ҫ�����ٳ�����
mm = 0;
for i = length(m)
    mm = max(mm,m(i));
end
mm


%save( 'upHt.met','E');
save( 'downHt.met','E');




% ma = zeros(18,1);
% mi = zeros(18,1);

% ����ؿ���
% for i = 1:18
%     for j = 1:14
%         ma(i,1) = max(B(i,j),ma(i,1));
%     end
% end
% ��С�ؿ���
% for i = 1:18
%     for j = 1:14
%         mi(i,1) = min(B(i,j),mi(i,1));
%     end
% end


% ��״ͼ
% figure
% subplot(1,2,1);
% bar(ma);
% set(gca,'xtick',0.5:18.5);
% set(gca,'xticklabel',{'5','6','7','8','9','10','11','12',...
%     '13','14','15','16','17','18','19','20','21','22','23'});
% title('����ʱ��ι�����������ؿ���');
% xlabel('ʱ�̣��㣩');
% ylabel('������');

% subplot(1,2,2);
% bar(mi);
% set(gca,'xtick',0.5:18.5);
% set(gca,'xticklabel',{'5','6','7','8','9','10','11','12',...
%     '13','14','15','16','17','18','19','20','21','22','23'});
% title('����ʱ��ι���������С�ؿ���');
% xlabel('ʱ�̣��㣩');
% ylabel('������');



% ��ֵ
% E = cat(1,0,E);
% time = linspace(1,19,19)';
% x = 1:0.1:19;
% y = interp1(time,E,x,'cubic');

% ����ͼ
% figure
% plot(x,y,'-');
% set(gca,'xtick',time);
% set(gca,'xticklabel',{'5','6','7','8','9','10','11','12',...
    % '13','14','15','16','17','18','19','20','21','22','23'});
% title('����ʱ����ڳ��ϵ������������β�ֵ��');
% xlabel('ʱ�̣��㣩');
% ylabel('������');

