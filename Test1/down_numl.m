clc,clear all
load('down_max')
% down_numline = interp1(1:18,m,1:(1/60):18,'spline');

% figure
% bar(m);
% hold on;
% plot(1:(1/60):18,down_numline,'r-');
% set(gca,'xtick',0.5:18.5);
% set(gca,'xticklabel',{'5','6','7','8','9','10','11','12',...
    % '13','14','15','16','17','18','19','20','21','22','23'});
% title('���и���ʱ��ι�����������ؿ���');
% xlabel('ʱ�̣��㣩');
% ylabel('����ؿ���');


%% �Ż����緢��������վʱ������ؿ���

youhua = cat(1,cat(1,0,m),0)
Ydown_numline = interp1(1:20,youhua,1:(1/60):20,'spline');

figure
bar(youhua);
hold on;
plot(1:(1/60):20,Ydown_numline,'r-');
set(gca,'xtick',0.5:20.5);  
set(gca,'xticklabel',{'4','5','6','7','8','9','10','11','12',...
    '13','14','15','16','17','18','19','20','21','22','23','24'});
title('�Ż������и���ʱ��ι�����������ؿ���');
xlabel('ʱ�̣��㣩');
ylabel('����ؿ���');

%% ��߷��
aver = sum(m) / 18;
figure

plot(1:(1/60):20,Ydown_numline,'b-');
grid on;
hold on;
% ����
xrange = get(gca,'xlim');
plot(xrange,[aver aver],'r-');
set(gca,'xtick',0.5:20.5);
set(gca,'xticklabel',{'4','5','6','7','8','9','10','11','12',...
    '13','14','15','16','17','18','19','20','21','22','23','24'});
title('�Ż������и���ʱ��ι�����������ؿ���');
xlabel('ʱ�̣��㣩');
ylabel('����ؿ���');
