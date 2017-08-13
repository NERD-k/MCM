%   ��Ӱ��
clc,clear

%% �������
H = 3;
latitude = 39+54./60+26+(60.*60);
longitude = 116+23./60+29/(60.*60);
month = 10;
day = 22;
start_time = 9.0;
end_time = 15.0;

%% ���Ӱ��
h = angle(latitude,longitude,month,day,start_time,end_time);  % latitudeγ��  longitude����
L = H ./ tan(h);

%% Ѱ�����Ӱ����ʱ��
shortL = 10;
for j = 1:length(L)
    shortL = min(shortL,L(j));
    if min(shortL,L(j)) == L(j)
        time_shortL = j;
    end
end
hour_time_shortL = 9 + floor(time_shortL / 10000);
minute_time_shortL = 60*(time_shortL - floor(time_shortL / 10000)*10000)/10000;

%% ��ͼ
figure
plot(start_time:0.0001:end_time,L,'b-');
hold on;
title('3�׸ߵ�ֱ�˵�̫��Ӱ�ӳ��ȵı仯����');
xlabel('ʱ��');
ylabel('ֱ�˵�̫��Ӱ�ӳ���');
j = 9 + time_shortL/10000 * ones(1,121);
line = 4:0.01:5.2;
plot(j,line,'r-');
hold on;
legend('Ӱ�ӳ��ȵı仯����','���Ӱ��ʱ��㣺12:14:44');
