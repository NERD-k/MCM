clc,clear all
load('up_max')
%up_numline = interp1(1:18,m,1:(1/60):18,'spline');

% figure
% bar(m);
% hold on;
% plot(1:(1/60):18,up_numline,'r-');
% set(gca,'xtick',0.5:18.5);
% set(gca,'xticklabel',{'5','6','7','8','9','10','11','12',...
    % '13','14','15','16','17','18','19','20','21','22','23'});
% title('上行各个时间段公交车的最大载客量');
% xlabel('时刻（点）');
% ylabel('最大载客量');


%% 优化最早发车和最晚到站时的最大载客量

youhua = cat(1,cat(1,0,m),0)
Yup_numline = interp1(1:20,youhua,1:(1/60):20,'spline');

figure
bar(youhua);
hold on;
plot(1:(1/60):20,Yup_numline,'r-');
set(gca,'xtick',0.5:20.5);
set(gca,'xticklabel',{'4','5','6','7','8','9','10','11','12',...
    '13','14','15','16','17','18','19','20','21','22','23','24'});
title('优化后上行各个时间段公交车的最大载客量');
xlabel('时刻（点）');
ylabel('最大载客量');

%% 早高峰
aver = sum(m) / 18;
figure

plot(1:(1/60):20,Yup_numline,'b-');
grid on;
hold on;
% 均线
xrange = get(gca,'xlim');
plot(xrange,[aver aver],'r-');
set(gca,'xtick',0.5:20.5);
set(gca,'xticklabel',{'4','5','6','7','8','9','10','11','12',...
    '13','14','15','16','17','18','19','20','21','22','23','24'});
title('优化后上行各个时间段公交车的最大载客量');
xlabel('时刻（点）');
ylabel('最大载客量');
