clc,clear

%% ��֪����
l_5 = 0.18;
m_5 = 28.12;
l = (1 - 2 / 5) * l_5;        % ���ڵ���Ч����
% L I��ê������Ҫ���ܳ���
N = L / ((1 - 2/5) * l_5);    % �����������
m5 = L * m_5 / N;             % ê�����������

m4 = 1200;                                  % �����������

g = 9.8;
rho = 1025;                     % ��ˮ�ܶ�
m1 = 1000;                      % ���������
m2 = 10;                        % ÿ�ڸֹܵ�����
m3 = 100;                       % ��Ͱ������
m6 = 600;                       % ê������
R_fubiao = 2 / 2;               % ����İ뾶
R_tieguan = 0.05 / 2;           % �ֹܵİ뾶
R_tietong = 0.3 / 2;            % ��Ͱ�İ뾶

F_tieguan = rho * pi * R_tieguan^2 * 1;       % �ֹܵĸ���
F_tietong = rho * pi * R_tietong^2 * 1;       % ��Ͱ�ĸ���

Hmax = 20;
Hmin = 16;
v_fengmax = 36;
v_shuimax = 1.5;
%% ��������
h = 0.75097;                                % ��ʼ��ˮ���

%% ��������
F_feng = 0.625 * R_fubiao * (2 - h) * v_feng^2;    % ���������
F_shui = 374 * R_fubiao * h * v_shui^2;
F = F_feng + F_shui;
F_fubiao = rho * pi * R_fubiao^2 * h;         % ����ĸ���
% �ϰ벿����������
a = zeros(6,1);
a(1,1) = g * (F_fubiao - m1);
a(2,1) = g * (F_fubiao + F_tieguan - m1 - m2);
a(3,1) = g * (F_fubiao + 2 * F_tieguan - m1 - 2*m2);
a(4,1) = g * (F_fubiao + 3 * F_tieguan - m1 - 3*m2);
a(5,1) = g * (F_fubiao + 4 * F_tieguan - m1 - 4*m2);
a(6,1) = g * (F_fubiao + 4 * F_tieguan + F_tietong - m1 - 4*m2 - m3 - m4);

%% ��������
n = a(6,1) ./ (g * m5);
if n >= N
    n = N;
end
M = cumsum(g * m5 * ones(round(n),1));

%% ����������б�Ƕȣ�����ֱ����ļнǣ�
alpha = atand(F ./ a);
theta = atand(F ./ (a(6,1) - M));

%% ��������
T = (a(6,1) - M) ./ (cosd(theta));
f = a ./ cosd(alpha);

%% �ж�ê
if T(end) >= g * m6
    error('Something goes wrong.')
end

%% �жϺ���
H = h + sum(cosd(alpha(1:5,1))) + sum(l * cosd(theta));

%% �������
% �ζ��뾶
youdong = l * (N - n) + sum(sind(alpha(1:5,1))) + sum(l * sind(theta));

% ê����״
% ������
temp = [0;l * (N - n)];
x = cumsum(l * sind(theta(end:-1:1)));
x = cat(1,temp,x);
% ������
temp = [0;0];
y = cumsum(l * cosd(theta(end:-1:1)));
y = cat(1,temp,y);
% ��ͼ
figure
plot(x,y,'r-');
hold on
plot(x(2),y(2),'b*');    % ê��ǡ�����뺣����λ��
title('����Ϊ36m/sˮ��Ϊ1.5m/sʱê������״');
