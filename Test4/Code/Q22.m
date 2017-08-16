clc,clear

%% 已知参数
g = 9.8;
rho = 1025;                     % 海水密度
l = (1 - 2 / 5) * 0.105;        % 链环的有效长度
N = 22.05 / ((1 - 2/5) * 0.105);% 链环最大数量
m1 = 1000;                      % 浮标的质量
m2 = 10;                        % 每节钢管的质量
m3 = 100;                       % 钢桶的质量
m5 = 22.05 * 7 / N;             % 锚链链结的质量
m6 = 600;                       % 锚的质量
R_fubiao = 2 / 2;               % 浮标的半径
R_tieguan = 0.05 / 2;           % 钢管的半径
R_tietong = 0.3 / 2;            % 钢桶的半径

F_tieguan = rho * pi * R_tieguan^2 * 1;       % 钢管的浮力
F_tietong = rho * pi * R_tietong^2 * 1;       % 钢桶的浮力

%% 待定参数
v = 36;                                       % 风速
H0 = 18;                                      % 水深
H = 23;                                       % 初始水深
h = 0.9416;                                    % 初始吃水深度
m4 = 1773;                                    % 初始重物球的质量


%% 迭代确定吃水深度h

    %% 受力分析
    F_feng = 0.625 * 2 * R_fubiao * (2 - h) * v^2;    % 近海风荷载
    F_fubiao = rho * pi * R_fubiao^2 * h;             % 浮标的浮力
    % 上半部分受力分析
    a = zeros(6,1);
    a(1,1) = g * (F_fubiao - m1);
    a(2,1) = g * (F_fubiao + F_tieguan - m1 - m2);
    a(3,1) = g * (F_fubiao + 2 * F_tieguan - m1 - 2*m2);
    a(4,1) = g * (F_fubiao + 3 * F_tieguan - m1 - 3*m2);
    a(5,1) = g * (F_fubiao + 4 * F_tieguan - m1 - 4*m2);
    a(6,1) = g * (F_fubiao + 4 * F_tieguan + F_tietong - m1 - 4*m2 - m3 - m4);
    
    %% 链节数量
    n = a(6,1) ./ (g * m5);
    if n >= N
        n = N;
    end
    M = cumsum(g * m5 * ones(round(n),1));
    
    %% 合作用力倾斜角度（于竖直方向的夹角）
    alpha = atand(F_feng ./ a);
    theta = atand(F_feng ./ (a(6,1) - M));
    
    %% 合作用力
    T = (a(6,1) - M) ./ (cosd(theta));
    f = a ./ cosd(alpha);
    
    %% 判断锚
    if T(end) >= g * m6
        error('锚离开海床。')
    end
    
    %% 计算数值海深、钢桶的倾斜角度、锚点与海床的夹角
    H = h + sum(cosd(alpha(1:5,1))) + sum(l * cosd(theta));

%% 计算重物球最大质量
clear m4
syms m4
F_fubiao_max = rho * pi * R_fubiao^2 * 2;     % 浮标的最大浮力
F_zong_max = F_fubiao_max + F_tietong + 4 * F_tieguan
G_zong = m1 + 4 * m2 + m3 + m4 + (18 - 2 - 5) / l * m5
solve('F_zong_max = G_zong','m4')