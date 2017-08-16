clc,clear

%% ��֪����
g = 9.8;
rho = 1025;                     % ��ˮ�ܶ�
l = (1 - 2 / 5) * 0.105;        % ��������Ч����
N = 22.05 / ((1 - 2/5) * 0.105);% �����������
m1 = 1000;                      % ���������
m2 = 10;                        % ÿ�ڸֹܵ�����
m3 = 100;                       % ��Ͱ������
m5 = 22.05 * 7 / N;             % ê�����������
m6 = 600;                       % ê������
R_fubiao = 2 / 2;               % ����İ뾶
R_tieguan = 0.05 / 2;           % �ֹܵİ뾶
R_tietong = 0.3 / 2;            % ��Ͱ�İ뾶

F_tieguan = rho * pi * R_tieguan^2 * 1;       % �ֹܵĸ���
F_tietong = rho * pi * R_tietong^2 * 1;       % ��Ͱ�ĸ���

%% ��������
v = 36;                                       % ����
H0 = 18;                                      % ˮ��
H = 23;                                       % ��ʼˮ��
h = 0.9416;                                    % ��ʼ��ˮ���
m4 = 1773;                                    % ��ʼ�����������


%% ����ȷ����ˮ���h

    %% ��������
    F_feng = 0.625 * 2 * R_fubiao * (2 - h) * v^2;    % ���������
    F_fubiao = rho * pi * R_fubiao^2 * h;             % ����ĸ���
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
    alpha = atand(F_feng ./ a);
    theta = atand(F_feng ./ (a(6,1) - M));
    
    %% ��������
    T = (a(6,1) - M) ./ (cosd(theta));
    f = a ./ cosd(alpha);
    
    %% �ж�ê
    if T(end) >= g * m6
        error('ê�뿪������')
    end
    
    %% ������ֵ�����Ͱ����б�Ƕȡ�ê���뺣���ļн�
    H = h + sum(cosd(alpha(1:5,1))) + sum(l * cosd(theta));

%% �����������������
clear m4
syms m4
F_fubiao_max = rho * pi * R_fubiao^2 * 2;     % ����������
F_zong_max = F_fubiao_max + F_tietong + 4 * F_tieguan
G_zong = m1 + 4 * m2 + m3 + m4 + (18 - 2 - 5) / l * m5
solve('F_zong_max = G_zong','m4')