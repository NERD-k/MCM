%% 问题求解
% 游动半径
youdong = l * (N - n) + sum(sind(alpha(2:6,1))) + sum(l * sind(theta));

% 锚链形状
% 横坐标
x = cumsum(l * sind(theta(end:-1:1)));
% 纵坐标
y = cumsum(l * cosd(theta(end:-1:1)));
% 画图
figure
plot(x,y,'r-');
hold on
plot(x(1),y(1),'b*');    % 锚链恰好脱离海床的位置
title('风速为36m/s时锚链的形状');