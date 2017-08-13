clc,clear

load origin.mat
load jingdu.mat
load fang.mat
t2 = (time2 - T2) .* pi ./ 12;
t3 = (time3 - T3) .* pi ./ 12;

%% 搜索赋值
day = [1:365];
days = [];
for i = 1:181
    days = cat(1,days,day);
end
days = days';
weidu = [-90:90];
weidus = [];
for i = 1:365
    weidus = cat(1,weidus,weidu);
end

%% 转化为 $phi deltas$
phi = weidus;
delta = day2delta(days);
deltas = [];
for i = 1:181
    deltas = cat(2,deltas,delta);
end
%% 高度角，方位角
for i = 1:21
    h2(:,:,i) = asin(sin(phi) .* sin(deltas) + cos(phi) .* cos(deltas) .* cos(t2(i)));
    A2(:,:,i) = acos((sin(h2(:,:,i)) .* sin(phi) - sin(deltas)) ./ (cos(h2(:,:,i)) .* cos(phi)));
    h3(:,:,i) = asin(sin(phi) .* sin(deltas) + cos(phi) .* cos(deltas) .* cos(t3(i)));
    A3(:,:,i) = acos((sin(h3(:,:,i)) .* sin(phi) - sin(deltas)) ./ (cos(h3(:,:,i)) .* cos(phi)));
end
%% 方位角变化量（每三分钟）
for i = 1:20
    ANS2(:,:,i) = A2(:,:,i+1) - A2(:,:,i);
    ANS3(:,:,i) = A3(:,:,i+1) - A3(:,:,i);
end

for i = 1:365
    for j = 1:181
        temp = reshape(ANS2(i,j,:),20,1);
        Temp = reshape(ANS3(i,j,:),20,1);
        cha2(i,j) = sum(((fang2 - temp)*1000).^2);
        cha3(i,j) = sum(((fang3 - Temp)*1000).^2);
    end
end
save('cha2.mat','cha2');
save('cha3.mat','cha3');