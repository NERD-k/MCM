clc,clear

%% ��֪����
g = 9.8;
rho = 1025;                     % ��ˮ�ܶ�
m1 = 1000;                      % ���������
m2 = 10;                        % ÿ�ڸֹܵ�����
m3 = 100;                       % ��Ͱ������
m4 = 1200;                      % ���������
m5 = 22.05*7/(22.05/((1 - 2/5) * 0.105));     % ê�����������
R_fubiao = 2 / 2;               % ����İ뾶
R_tieguan = 0.05 / 2;           % ���ܵİ뾶
R_tietong = 0.3 / 2;            % ��Ͱ�İ뾶
l = (1 - 2 / 5) * 0.105;

F_tieguan = g * rho * pi * R_tieguan^2 * 1;      % �ֹܵĸ���
F_tietong = g * rho * pi * R_tietong^2 * 1;      % ��Ͱ�ĸ���

v = 0;
h = 0.5;      % ��ʼ��ˮ���
%% ��������
F_feng = 0.625 * R_fubiao * (2 - h) * v^2;     % ���������
F_fubiao = g * rho * pi * R_fubiao^2 * h;      % ����ĸ���
% �ϰ벿����������
a = zeros(5,1);
a(1) = g * (rho * pi * h - m1);
a(2) = g * (rho * pi * h + F_tieguan - m1 - m2);
a(3) = g * (rho * pi * h + 2 * F_tieguan - m1 - 2*m2);
a(4) = g * (rho * pi * h + 3 * F_tieguan - m1 - 3*m2);
a(5) = g * (rho * pi * h + 4 * F_tieguan - m1 - 4*m2);
maolian = g * (rho * pi * h + 4 * F_tieguan + F_tietong - m1 - 4*m2 - m3 - m4);

%% ��������
n = maolian ./ (g * m5);
if n >= 22.05/((1 - 2/5) * 0.105)
    n = 22.05/((1 - 2/5) * 0.105);
end
M = cumsum(g * m5 * ones(floor(n),1));

%% ��б�Ƕȣ�����ֱ����ļнǣ�
alpha = atand(F_feng ./ a);
theta(1,1) = atand(F_feng ./ maolian);
theta(2:n+1,1) = atand(F_feng ./ (maolian - M));

% ��⺣��
H = h + sum(cosd(alpha)) + sum(l * cosd(theta(1:n)))
% �ζ��뾶
youdong = sum(sind(alpha)) + sum(l * sind(theta(1:n)));
