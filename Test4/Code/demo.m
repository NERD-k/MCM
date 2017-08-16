clc,clear

ll = 0.12;  mm = 12;
dd =18; v = [36 1.5];

g = 9.8;
rho = 1025;
V1 = 0.15^2 * pi;
V2 = 0.025^2 * pi;
V = V1 + V2 * 4;
%R_tieguan = 0.05 / 2;           % 钢管的半径
%R_tietong = 0.3 / 2;            % 钢桶的半径
%F_tieguan = rho * pi * R_tieguan^2 * 1;       % 钢管的浮力
%F_tietong = rho * pi * R_tietong^2 * 1;       % 钢桶的浮力
%F_zong = F_tietong + 4 * F_tieguan;
m = mm * 11;
h = 2;d = 2;
Q = 1;
for l = 155:300
    for N = 0:1:5880
        M = [1000 40 100 3956.6 (1-5) * ll * mm 600];
        F = zeros(1,l+1);
        s = (sum(M) - N / g - V) / (rho * pi);
        f1 = 0.625 * d * (h-s) * v(1)^2;
        f2 = 374 * d * s * v(2)^2;
        f = f1 + f2;
        F(5) = sum(M(3:end)) * g - N - V1 * rho * g;
        F(6) = (sum(M(4:end))) * g - N;
        for i = 4:-1:1
            F(i) = F(i+1) + M(2) / 4 * g - rho * g * V2;
        end
        F(7) = F(6) - M(4) * g;
        for i = 7:l
            F(i+1) = F(i) - m * g;
        end
        tan_theta = zeros(1,l);
        for i = 1:l
            if i < 5
                tan_theta(i) = (F(i) + F(i+1)) / (2*f + (2*i-1)*42.05);
            elseif i == 5
                tan_theta(i) = (F(i) + F(i+1)) / (2*f + 589.05);
            else
                tan_theta(i) = (F(i) + F(i+1)) / (2*f + 841.5);
            end
        end
        sin_theta = tan_theta ./ sqrt(1+(tan_theta) .^ 2);
        cos_theta = 1 ./ sqrt(1 + (tan_theta) .^ 2);
        x = zeros(1,l+1);
        y = zeros(1,l+1);
        y(1) = -s;
        for i = 2:l+1
            if i<7
                x(i) = x(i-1) - cos_theta(i-1);
                y(i) = y(i-1) - sin_theta(i-1);
            else
                x(i) = x(i-1) - ll * cos_theta(i-1);
                y(i) = y(i-1) - ll * sin_theta(i-1);
            end
        end
        if abs(y(l+1)+dd) < 0.1 && sin_theta(5) > sin(85/180*pi) ...
                && sin_theta(end) < sin(16 * pi / 180)
            if (abs(x(l+1)) < 25)
                if (sin_theta(5) < Q)
                    if(Q-sin_theta(5) < 0.0001)
                        break;
                    end
                    Q = sin_theta(5);
                end
            end
        end
        
        if (abs(y(l+1) + dd ) < 0.1 && sin_theta(5) > sin(85/180*pi) && sin_theta(end) ...
                < sin(16*pi/180))
            if (abs(x(l+1)) < 25)
                if (sin_theta(5) < Q)
                    if (abs(sin_theta(5) - Q) < 0.0001)
                        break;
                    end
                    Q = sin_theta(5);
                end
            end
        end
    end
end
plot(x,y,'+')
theta = atand(tan_theta);
axis equal