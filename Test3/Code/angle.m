function data = angle(  )   % latitude纬度  longitude经度
%% 计算太阳高度角data
%   h为太阳高度角，phi为当地纬度，delta为赤纬角，t为时角
%   $ sin(h) = sin(phi)sin(delta)+cos(phi)cos(delta)cos(t)$

phi = latitude;

switch month
    case 1
        N = day;
    case 2
        N = 31 + day;
    case 3
        N = 31 + 28 + day;
    case 4
        N = 31 + 28 + 31 + day;
    case 5
        N = 31 + 28 + 31 + 30 + day;
    case 6
        N = 31 + 28 + 31 + 30 + 31 + day;
    case 7
        N = 31 + 28 + 31 + 30 + 31 + 30 + day;
    case 8
        N = 31 + 28 + 31 + 30 + 31 + 30 + 31 + day;
    case 9
        N = 31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + day;
    case 10
        N = 31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + day;
    case 11
        N = 31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 + day;
    case  12
        N = 31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 + 30 + day;
    otherwise error('输入的月份有错');
end
delta = ((23 + 27/60)*cos((360/365)*(N+10)))    % 赤纬角

hours = hour + (minute / 60);
t = 15 * (hours - 12);

data = asin(sin(phi)sin(delta) + cos(phi)cos(delta)cos(t));
