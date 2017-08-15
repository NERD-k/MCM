clc,clear

%% 已知参数
g = 9.8;
rho = 1025;                     % 海水密度
m1 = 1000;                      % 浮标的质量
m2 = 10;                        % 每节钢管的质量
m3 = 100;                       % 钢桶的质量
m4 = 1200;                      % 铁球的质量
m5 = 22.05*7/(22.05/((1 - 2/5) * 0.105));     % 锚链链结的质量
R_fubiao = 2 / 2;               % 浮标的半径
R_tieguan = 0.05 / 2;           % 铁管的半径
R_tietong = 0.3 / 2;            % 铁桶的半径
l = (1 - 2 / 5) * 0.105;

F_tieguan = g * rho * pi * R_tieguan^2 * 1;      % 钢管的浮力
F_tietong = g * rho * pi * R_tietong^2 * 1;      % 铁桶的浮力

v = 0;
h = 0.5;      % 初始吃水深度
%% 受力分析
F_feng = 0.625 * R_fubiao * (2 - h) * v^2;     % 近海风荷载
F_fubiao = g * rho * pi * R_fubiao^2 * h;      % 浮标的浮力
% 上半部分受力分析
a = zeros(5,1);
a(1) = g * (rho * pi * h - m1);
a(2) = g * (rho * pi * h + F_tieguan - m1 - m2);
a(3) = g * (rho * pi * h + 2 * F_tieguan - m1 - 2*m2);
a(4) = g * (rho * pi * h + 3 * F_tieguan - m1 - 3*m2);
a(5) = g * (rho * pi * h + 4 * F_tieguan - m1 - 4*m2);
maolian = g * (rho * pi * h + 4 * F_tieguan + F_tietong - m1 - 4*m2 - m3 - m4);

%% 链节数量
n = maolian ./ (g * m5);
if n >= 22.05/((1 - 2/5) * 0.105)
    n = 22.05/((1 - 2/5) * 0.105);
end
M = cumsum(g * m5 * ones(floor(n),1));

%% 倾斜角度（于竖直方向的夹角）
alpha = atand(F_feng ./ a);
theta(1,1) = atand(F_feng ./ maolian);
theta(2:n+1,1) = atand(F_feng ./ (maolian - M));

% 求解海深
H = h + sum(cosd(alpha)) + sum(l * cosd(theta(1:n)))
% 游动半径
youdong = sum(sind(alpha)) + sum(l * sind(theta(1:n)));
