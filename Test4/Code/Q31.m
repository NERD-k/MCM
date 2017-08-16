clc,clear

%% ��֪����
l_1 = 0.078;    l_2 = 0.105;    l_3 = 0.120;    l_4 = 0.150;    l_5 = 0.180;
m_1 = 3.2;      m_2 = 7;        m_3 = 12.5;     m_4 = 19.5;     m_5 = 28.12;
L_1 = 201 * l_1;L_2 = 201 * l_2;L_3 = 201 * l_3;L_4 = 201 * l_4;L_5 = 201 * l_5;


m_init = m_1;
l_init = l_1;
% L ?��ê������Ҫ���ܳ���
L_init = L_1;
l = (1 - 2 / 5) * l_init;          % ��������Ч����

N = L_init / ((1 - 2/5) * l_init);      % �����������
m5 = L_init * m_init / N;               % ê�����������

g = 9.8;                        % �������ٶ�
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

v_feng = v_fengmax;
v_shui = v_shuimax;

%% ��������
% for h = 
h = 1.15;                                       % ��ʼ��ˮ���
m4 = 2200;                                      % �����������
%% ��������
F_feng = 0.625 * 2 * R_fubiao * (2 - h) * v_feng^2;% ���������
F_shui = 374 * R_fubiao * h * v_shui^2;            % ����ˮ����
F = F_feng + F_shui;                               % ˮƽ���������
F_fubiao = rho * pi * R_fubiao^2 * h;              % ����ĸ���
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
if T(end)*cosd(theta(end)) >= g * m6
    error('Something goes wrong.')
end

%% �жϺ���
H = h + sum(cosd(alpha(1:5,1))) + sum(l * cosd(theta));

%% �������
% �ζ��뾶
R = l * (N - n) + sum(sind(alpha(1:5,1))) + sum(l * sind(theta));

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
% figure
% plot(x,y,'r-');
% hold on
% plot(x(2),y(2),'b*');    % ê��ǡ�����뺣����λ��
% title('����Ϊ36m/sˮ��Ϊ1.5m/sʱê������״');
% legend('ê����״','ê��ǡ���뿪����λ��','Location','northwest','horizontal')
H
alpha(5)
theta(end)
