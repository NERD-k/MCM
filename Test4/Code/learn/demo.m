[T,F] = ode45(@test_fun,[0 15],[1 1 3]);
subplot(121)
plot(T,F)%Matlab�Դ���ode45����Ч��
title('ode45����Ч��')
[T1,F1]=runge_kutta1(@test_fun,[1 1 3],0.25,0,15);%����ʱ�ı�test_fun�ĺ���ά���������Ǹı��ʼֵ��ά��
subplot(122)
plot(T1,F1)%�Ա�������������Ч��
title('�Ա��   �����������')