clc, clear all


% 读取文件
% 如要修改，将***.xlsx文件路径填入，或者放在此m文件相同目录下，使用xlsread('***.xlsx')
%data = xlsread('D:\Mcm\Test1\上行上下车.xlsx');
data = xlsread('D:\Mcm\Test1\下行上下车.xlsx');

% 上车下车人数分别存储在矩阵 up 和 down 中
for i = 1:2:36
    up((i+1)/2,:) = data(i,:);
end
for i = 2:2:36
    down(i/2,:) = data(i,:);
end

% 每站上车人数与下车人数之差
A = up - down;
% 累积求和
B = cumsum(A');
B = B';


% 每个时间段的总净增加人数
D = B(:,13);

% 每个时间段的净人数
E = cumsum(D);

% 每个时间段需要的车辆数下限
m = E / 120;

% 寻找一天所要的最少车辆数
mm = 0;
for i = length(m)
    mm = max(mm,m(i));
end
mm


%save( 'upHt.met','E');
save( 'downHt.met','E');




% ma = zeros(18,1);
% mi = zeros(18,1);

% 最大载客量
% for i = 1:18
%     for j = 1:14
%         ma(i,1) = max(B(i,j),ma(i,1));
%     end
% end
% 最小载客量
% for i = 1:18
%     for j = 1:14
%         mi(i,1) = min(B(i,j),mi(i,1));
%     end
% end


% 柱状图
% figure
% subplot(1,2,1);
% bar(ma);
% set(gca,'xtick',0.5:18.5);
% set(gca,'xticklabel',{'5','6','7','8','9','10','11','12',...
%     '13','14','15','16','17','18','19','20','21','22','23'});
% title('各个时间段公交车的最大载客量');
% xlabel('时刻（点）');
% ylabel('总人数');

% subplot(1,2,2);
% bar(mi);
% set(gca,'xtick',0.5:18.5);
% set(gca,'xticklabel',{'5','6','7','8','9','10','11','12',...
%     '13','14','15','16','17','18','19','20','21','22','23'});
% title('各个时间段公交车的最小载客量');
% xlabel('时刻（点）');
% ylabel('总人数');



% 插值
% E = cat(1,0,E);
% time = linspace(1,19,19)';
% x = 1:0.1:19;
% y = interp1(time,E,x,'cubic');

% 曲线图
% figure
% plot(x,y,'-');
% set(gca,'xtick',time);
% set(gca,'xticklabel',{'5','6','7','8','9','10','11','12',...
    % '13','14','15','16','17','18','19','20','21','22','23'});
% title('各个时间段在车上的总人数（三次插值）');
% xlabel('时刻（点）');
% ylabel('总人数');

