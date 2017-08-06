clc,clear

load('data.mat');

figure
X = 1:27;
plot(X,red1var,'r-');
hold on;
plot(X,red1var,'r*');
hold on
plot(X,red2var,'b-');
hold on;
plot(X,red2var,'bo');
hold on;
title('两组评酒员对红葡萄酒的评分方差比较');
xlabel('27种红葡萄酒样品');
ylabel('方差值');
legend('第一组方差连线','第一组评酒结果','第二组方差连线','第二组评酒结果');

figure
X = 1:28;
plot(X,write1var,'r-');
hold on;
plot(X,write1var,'r*');
hold on
plot(X,write2var,'b-');
hold on;
plot(X,write2var,'bo');
hold on;
title('两组评酒员对白葡萄酒的评分方差比较');
xlabel('28种白葡萄酒样品');
ylabel('方差值');
legend('第一组方差连线','第一组评酒结果','第二组方差连线','第二组评酒结果');
