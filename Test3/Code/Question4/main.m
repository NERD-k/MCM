load data.mat

ganC = abs(ganding(1,1) - dizuo(1,1));   % �˵����ظ�
yingc = yingchang - dizuo;          % Ӱ��
yingC = yingc .^2;
yingC = sqrt(sum(yingC'));
yingC = yingC';

% ʵ�ʸ˳�
Ying = 2 .* yingC ./ ganC;

time = 8.9:0.0167:9.57;
time = time';

xishu = [0.132 -3.222 21.23];
T = -(xishu(1,2) ./ (2 .* xishu(1,1)));
Y = xishu(1,3) - (xishu(1,2) .^2 / 4.*xishu(1,1));
J = 2 .*pi ./ 3 - (T - 12) .* pi ./ 12;
jingdu = J .* (180 ./ pi);

syms phi delta h t

t = 0;
delta = day2delta(194)

f = sin(h) - sin(phi)*sin(delta) + cos(phi)*cos(delta)*cos(t);

ANS = solve(f,phi)

