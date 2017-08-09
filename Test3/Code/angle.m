function data = angle(latitude,longitude,month,day,start_time,end_time)   % latitude纬度  longitude经度
%% 求解太阳高度角
%   h太阳高度角 phi纬度 delt赤纬角 t时角
%   $ sin(h) = sin(phi)sin(delta)+cos(phi)cos(delta)cos(t) $

phi = latitude;

%% 求赤纬角
% switch month
    % case 1
        % N = day;
    % case 2
        % N = 31 + day;
    % case 3
        % N = 31 + 28 + day;
    % case 4
        % N = 31 + 28 + 31 + day;
    % case 5
        % N = 31 + 28 + 31 + 30 + day;
    % case 6
        % N = 31 + 28 + 31 + 30 + 31 + day;
    % case 7
        % N = 31 + 28 + 31 + 30 + 31 + 30 + day;
    % case 8
        % N = 31 + 28 + 31 + 30 + 31 + 30 + 31 + day;
    % case 9
        % N = 31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + day;
    % case 10
        % N = 31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + day;
    % case 11
        % N = 31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 + day;
    % case  12
        % N = 31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 + 30 + day;
    % otherwise error('输入的月份有错');
% end
% delta = ((23 + 27/60).*cos((360/365).*(N+10)));    % 赤纬角与一年之间的天数N的关系
% 上面公式误差较大，改用下面公式
delta = -(23+27/60)*(29/90);

%% 求时角
hours = start_time:0.0001:end_time;
t = 15 .* (hours - 12)*(pi/180) + (longitude - 120)*(pi/180);

%% 太阳高度角
data = abs(asin(sin(phi).*sin(delta) + cos(phi).*cos(delta).*cos(t)));
