%% �������
% �ζ��뾶
youdong = l * (N - n) + sum(sind(alpha(2:6,1))) + sum(l * sind(theta));

% ê����״
% ������
x = cumsum(l * sind(theta(end:-1:1)));
% ������
y = cumsum(l * cosd(theta(end:-1:1)));
% ��ͼ
figure
plot(x,y,'r-');
hold on
plot(x(1),y(1),'b*');    % ê��ǡ�����뺣����λ��
title('����Ϊ36m/sʱê������״');