clc,clear

load('data.mat');

figure
X = 1:27;
plot(X,red1var,'r-');
hold on;
plot(X,red1var,'r*');
hold on
plot(X,red2var,'b-');
hold on;
plot(X,red2var,'bo');
hold on;
title('��������Ա�Ժ����ѾƵ����ַ���Ƚ�');
xlabel('27�ֺ����Ѿ���Ʒ');
ylabel('����ֵ');
legend('��һ�鷽������','��һ�����ƽ��','�ڶ��鷽������','�ڶ������ƽ��');

figure
X = 1:28;
plot(X,write1var,'r-');
hold on;
plot(X,write1var,'r*');
hold on
plot(X,write2var,'b-');
hold on;
plot(X,write2var,'bo');
hold on;
title('��������Ա�԰����ѾƵ����ַ���Ƚ�');
xlabel('28�ְ����Ѿ���Ʒ');
ylabel('����ֵ');
legend('��һ�鷽������','��һ�����ƽ��','�ڶ��鷽������','�ڶ������ƽ��');
