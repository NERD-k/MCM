function [] = diedai(chushizhi,fengsu,shuishen)

%% 初始化,
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

F_tieguan = g * rho * pi * R_tieguan^2 * 1;     % 钢管的浮力
F_tietong = g * rho * pi * R_tietong^2 * 1;      % 铁桶的浮力

%% 赋值
h = 1;      % 初始吃水深度
F_feng = 0.625 * R_fubiao * (2 - h) * v^2;     % 近海风荷载
F_fubiao = g * rho * pi * R_fubiao^2 * h;      % 浮标的浮力

sym ff
sym aa
sym f
sym a
%% 系泊系统上半部分


%% 系泊系统上半部分的水深
%H = h + l1 + l2 + l3 + l4 + l5;

%% 悬链线初始化
a = zeros(350,1);
f = zeros(350,1);
solve('a(1) = theta6');
solve('f(1) = f_6');
z = zeros(350,1);
% L = 5d;
L = 0.105*(1 - 2/5);
m = 7 / (1 / (0.105*(1 - 2/5)));
%% 悬链线
for i = 1:350
    solve('f(i+1) * sin(a(i+1)) = f(i) * sin(a(i))','f(i+1)');
    solve('f(i+1) * cos(a(i+1)) = f(i) * cos(a(i))','a(i+1)');
    z(i) = L * sin(a(i));
    if (sum(z)) >= 18
        break;
    end
end
    
    
    

