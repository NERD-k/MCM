%% 影子的方位角变化量
function [data] = fangwei(data1,data2)
    a2 = sum(data1.^2);
    b2 = sum(data2.^2);
    c2 = sum((data1 - data2).^2);
    data = acos((a2 + b2 - c2) ./ (2.*sqrt(a2).*sqrt(b2)));
end