
g = 9.8;
rho = 1025;                     % 海水密度
m1 = 1000;                      % 浮标的质量
m2 = 10;                        % 每节钢管的质量
m3 = 100;                       % 钢桶的质量
m4 = 1200;                      % 铁球的质量
m5 = 22.05*7;                   % 锚链的总质量
R_fubiao = 2 / 2;               % 浮标的半径
R_tieguan = 0.05 / 2;           % 铁管的半径
R_tietong = 0.3 / 2;            % 铁桶的半径

F_tieguan = g * rho * pi * R_tieguan^2 * 1;      % 钢管的浮力
F_tietong = g * rho * pi * R_tietong^2 * 1;      % 铁桶的浮力

h = 1;      % 初始吃水深度
F_feng = 0.625 * R_fubiao * (2 - h) * v^2;     % 近海风荷载
F_fubiao = g * rho * pi * R_fubiao^2 * h;      % 浮标的浮力
syms f_1 f_2 f_3 f_4 f_5 f_6
syms theta1 theta2 theta3 theta4 theta5 theta6
syms f a

% 浮标
ff1 = solve(F_fubiao - f_1 * sin(theta1) - m1 * g,f_1);
aa1 = solve(F_feng - f_1 * cos(theta1),theta1);
% l1 = sin(theta1);
% 铁管1
ff2 = solve('F_fubiao + F_tieguan - f_2 * sin(theta2) - m2 * g = 0','f_2');
aa2 = solve('f_1 * cos(theta1) - f_2 * cos(theta2) = 0','theta2');
% l2 = sin(theta2);
% 铁管2
ff3 = solve('F_fubiao + 2 * F_tieguan - f_3 * sin(theta3) - m2 * g = 0','f_3');
aa3 = solve('f_2 * cos(theta2) - f_3 * cos(theta3) = 0','theta3');
% l3 = sin(theta3);
% 铁管3
ff4 = solve('F_fubiao + 3 * F_tieguan - f_4 * sin(theta4) - m2 * g = 0','f_4');
aa4 = solve('f_3 * cos(theta3) - f_4 * cos(theta4) = 0','theta4');
% l4 = sin(theta4);
% 铁管4
ff5 = solve('F_fubiao + 4 * F_tieguan - f_5 * sin(theta5) - m2 * g = 0','f_5');
aa5 = solve('f_4 * cos(theta3) - f_5 * cos(theta5) = 0','theta5');
% l5 = sin(theta5);
% 铁桶
ff6 = solve('F_fubiao + 4 * F_tieguan + F_tietong - f_6 * sin(theta6) - m3 * g - m4 * g = 0','f_6');
aa6 = solve('f_5 * cos(theta6) - f_6 * cos(theta6) = 0','theta6');

% 系泊系统上半部分的水深
H = h + aa1 + aa2 + aa3 + aa4 + aa5;

% 悬链线初始化
a = zeros(350,1);
f = zeros(350,1);
a(1) = aa6;
f(1) = ff6;
z = zeros(350,1);
% L = 5d;
L = 0.105*(1 - 2/5);
m = 7 / (1 / (0.105*(1 - 2/5)));
% 悬链线
for i = 1:350
    solve('f(i+1) * sin(a(i+1)) = f(i) * sin(a(i))','f(i+1)');
    solve('f(i+1) * cos(a(i+1)) = f(i) * cos(a(i))','a(i+1)');
    z(i) = L * sin(a(i));
    if (sum(z)) >= 18
        break;
    end
end
    
    
    

