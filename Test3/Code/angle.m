<<<<<<< HEAD
function data = angle(latitude,longitude,month,day,start_time,end_time)   % latitudeγ��  longitude����
%% ���̫���߶Ƚ�
%   h̫���߶Ƚ� phiγ�� delt��γ�� tʱ��
%   $ sin(h) = sin(phi)sin(delta)+cos(phi)cos(delta)cos(t) $

phi = latitude;

%% ���γ��
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
    % otherwise error('������·��д�');
% end
% delta = ((23 + 27/60).*cos((360/365).*(N+10)));    % ��γ����һ��֮�������N�Ĺ�ϵ
% ���湫ʽ���ϴ󣬸������湫ʽ
delta = -(23+27/60)*(29/90);

%% ��ʱ��
hours = start_time:0.0001:end_time;
t = 15 .* (hours - 12)*(pi/180) + (longitude - 120)*(pi/180);

%% ̫���߶Ƚ�
data = abs(asin(sin(phi).*sin(delta) + cos(phi).*cos(delta).*cos(t)));
=======
function data = angle(  )   % latitudeγ��  longitude����
%% ����̫���߶Ƚ�data
%   hΪ̫���߶Ƚǣ�phiΪ����γ�ȣ�deltaΪ��γ�ǣ�tΪʱ��
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
    otherwise error('������·��д�');
end
delta = ((23 + 27/60)*cos((360/365)*(N+10)))    % ��γ��

hours = hour + (minute / 60);
t = 15 * (hours - 12);

data = asin(sin(phi)sin(delta) + cos(phi)cos(delta)cos(t));
>>>>>>> 7bb55afee198faaf6ab707f96dc1750e3ce39f0f
