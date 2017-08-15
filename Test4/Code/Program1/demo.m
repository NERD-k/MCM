
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

F_tieguan = g * rho * pi * R_tieguan^2 * 1;      % �ֹܵĸ���
F_tietong = g * rho * pi * R_tietong^2 * 1;      % ��Ͱ�ĸ���

h = 1;      % ��ʼ��ˮ���
F_feng = 0.625 * R_fubiao * (2 - h) * v^2;     % ���������
F_fubiao = g * rho * pi * R_fubiao^2 * h;      % ����ĸ���
syms f_1 f_2 f_3 f_4 f_5 f_6
syms theta1 theta2 theta3 theta4 theta5 theta6
syms f a

% ����
ff1 = solve(F_fubiao - f_1 * sin(theta1) - m1 * g,f_1);
aa1 = solve(F_feng - f_1 * cos(theta1),theta1);
% l1 = sin(theta1);
% ����1
ff2 = solve('F_fubiao + F_tieguan - f_2 * sin(theta2) - m2 * g = 0','f_2');
aa2 = solve('f_1 * cos(theta1) - f_2 * cos(theta2) = 0','theta2');
% l2 = sin(theta2);
% ����2
ff3 = solve('F_fubiao + 2 * F_tieguan - f_3 * sin(theta3) - m2 * g = 0','f_3');
aa3 = solve('f_2 * cos(theta2) - f_3 * cos(theta3) = 0','theta3');
% l3 = sin(theta3);
% ����3
ff4 = solve('F_fubiao + 3 * F_tieguan - f_4 * sin(theta4) - m2 * g = 0','f_4');
aa4 = solve('f_3 * cos(theta3) - f_4 * cos(theta4) = 0','theta4');
% l4 = sin(theta4);
% ����4
ff5 = solve('F_fubiao + 4 * F_tieguan - f_5 * sin(theta5) - m2 * g = 0','f_5');
aa5 = solve('f_4 * cos(theta3) - f_5 * cos(theta5) = 0','theta5');
% l5 = sin(theta5);
% ��Ͱ
ff6 = solve('F_fubiao + 4 * F_tieguan + F_tietong - f_6 * sin(theta6) - m3 * g - m4 * g = 0','f_6');
aa6 = solve('f_5 * cos(theta6) - f_6 * cos(theta6) = 0','theta6');

% ϵ��ϵͳ�ϰ벿�ֵ�ˮ��
H = h + aa1 + aa2 + aa3 + aa4 + aa5;

% �����߳�ʼ��
a = zeros(350,1);
f = zeros(350,1);
a(1) = aa6;
f(1) = ff6;
z = zeros(350,1);
% L = 5d;
L = 0.105*(1 - 2/5);
m = 7 / (1 / (0.105*(1 - 2/5)));
% ������
for i = 1:350
    solve('f(i+1) * sin(a(i+1)) = f(i) * sin(a(i))','f(i+1)');
    solve('f(i+1) * cos(a(i+1)) = f(i) * cos(a(i))','a(i+1)');
    z(i) = L * sin(a(i));
    if (sum(z)) >= 18
        break;
    end
end
    
    
    

