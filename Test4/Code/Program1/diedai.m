function [] = diedai(chushizhi,fengsu,shuishen)

%% ��ʼ��,
g = 9.8;
rho = 1025;                     % ��ˮ�ܶ�
m1 = 1000;                      % ���������
m2 = 10;                        % ÿ�ڸֹܵ�����
m3 = 100;                       % ��Ͱ������
m4 = 1200;                      % ���������
m5 = 22.05*7;                   % ê����������
R_fubiao = 2 / 2;               % ����İ뾶
R_tieguan = 0.05 / 2;           % ���ܵİ뾶
R_tietong = 0.3 / 2;            % ��Ͱ�İ뾶

F_tieguan = g * rho * pi * R_tieguan^2 * 1;     % �ֹܵĸ���
F_tietong = g * rho * pi * R_tietong^2 * 1;      % ��Ͱ�ĸ���

%% ��ֵ
h = 1;      % ��ʼ��ˮ���
F_feng = 0.625 * R_fubiao * (2 - h) * v^2;     % ���������
F_fubiao = g * rho * pi * R_fubiao^2 * h;      % ����ĸ���

sym ff
sym aa
sym f
sym a
%% ϵ��ϵͳ�ϰ벿��


%% ϵ��ϵͳ�ϰ벿�ֵ�ˮ��
%H = h + l1 + l2 + l3 + l4 + l5;

%% �����߳�ʼ��
a = zeros(350,1);
f = zeros(350,1);
solve('a(1) = theta6');
solve('f(1) = f_6');
z = zeros(350,1);
% L = 5d;
L = 0.105*(1 - 2/5);
m = 7 / (1 / (0.105*(1 - 2/5)));
%% ������
for i = 1:350
    solve('f(i+1) * sin(a(i+1)) = f(i) * sin(a(i))','f(i+1)');
    solve('f(i+1) * cos(a(i+1)) = f(i) * cos(a(i))','a(i+1)');
    z(i) = L * sin(a(i));
    if (sum(z)) >= 18
        break;
    end
end
    
    
    

